//
//  AppDelegate.swift
//  LaunchdExample
//
//  Created by 문철현 on 11/10/23.
//

import SwiftUI
import ServiceManagement

// macOS는 AppDelegate 안쓰고는 개발이 어려울듯 ..
class AppDelegate: NSObject, NSApplicationDelegate {
  static private(set) var instance: AppDelegate!
  
  // about Helper
  private var currentHelperConnection: NSXPCConnection?
  // 헬퍼 설치 상태
  @objc dynamic var helperIsInstalled = false
  private let helperIsInstalledKeyPath: String
  
  override init() {
    self.helperIsInstalledKeyPath = NSStringFromSelector(#selector(getter: self.helperIsInstalled))
  }
  
  func applicationDidFinishLaunching(_ notification: Notification) {
    AppDelegate.instance = self
    
    // 헬퍼 버전 체크
    self.helperInit()
  }
}

// MARK: - Privileged Helper
extension AppDelegate {
  
  func helperInstall() throws -> Bool {
    
    // Install and activate the helper inside our application bundle to disk.
    
    var cfError: Unmanaged<CFError>?
    var authItem = kSMRightBlessPrivilegedHelper.withCString { buf in
      return AuthorizationItem(name: buf, valueLength: 0, value:UnsafeMutableRawPointer(bitPattern: 0), flags: 0)
    }
    var authRights = withUnsafeMutablePointer(to: &authItem) { item in
      return AuthorizationRights(count: 1, items: item)
    }
    
    NSLog("Example::: authRights : \(authRights)")
    
    guard
      let authRef = try HelperAuthorization.authorizationRef(&authRights, nil, [.interactionAllowed, .extendRights, .preAuthorize]),
      SMJobBless(kSMDomainSystemLaunchd, HelperConstants.machServiceName as CFString, authRef, &cfError) else {
      if let error = cfError?.takeRetainedValue() {
        throw error
      }
      return false
    }
    
    self.currentHelperConnection?.invalidate()
    self.currentHelperConnection = nil
    
    return true
  }
  
  private func helperConnection() -> NSXPCConnection? {
    guard self.currentHelperConnection == nil else {
      return self.currentHelperConnection
    }
    
    let connection = NSXPCConnection(machServiceName: HelperConstants.machServiceName, options: .privileged)
    connection.exportedInterface = NSXPCInterface(with: AppProtocol.self)
    connection.exportedObject = self
    connection.remoteObjectInterface = NSXPCInterface(with: HelperProtocol.self)
    connection.invalidationHandler = {
      self.currentHelperConnection?.invalidationHandler = nil
      OperationQueue.main.addOperation {
        self.currentHelperConnection = nil
      }
    }
    
    self.currentHelperConnection = connection
    self.currentHelperConnection?.resume()
    
    return self.currentHelperConnection
  }
  
  private func helper(_ completion: ((Bool) -> Void)?) -> HelperProtocol? {
    
    // Get the current helper connection and return the remote object (Helper.swift) as a proxy object to call functions on.
    guard let helper = self.helperConnection()?.remoteObjectProxyWithErrorHandler({ error in
      NSLog("Helper connection was closed with error: \(error)")
      if let onCompletion = completion { onCompletion(false) }
    }) as? HelperProtocol else { return nil }
    return helper
  }
  
  private func helperStatus(completion: @escaping (_ installed: Bool) -> Void) {
    
    // Comppare the CFBundleShortVersionString from the Info.plist in the helper inside our application bundle with the one on disk.
    // let helperURL = Bundle.main.bundleURL.appendingPathComponent("Contents/Library/LaunchServices/" + HelperConstants.machServiceName)
    guard let helper = self.helper(completion) else {
      completion(false)
      return
    }
    
    NSLog("Example::: helper version : \(helperVersion)")

    helper.getVersion { installedHelperVersion in
      NSLog("Example::: \(installedHelperVersion)")
      completion(installedHelperVersion == helperVersion)
      //            테스트를 위해 무조건 설치
      //            completion(false)
    }
  }
  
  private func helperInit() {
    // Update the current authorization database right
    // This will prmpt the user for authentication if something needs updating.
    do {
      try HelperAuthorization.authorizationRightsUpdateDatabase()
    } catch {
      NSLog("Failed to update the authorization database rights with error: \(error)")
    }
    
    // Check if the current embedded helper tool is installed on the machine.
    self.helperStatus { installed in
      NSLog("Example::: \(installed.description)")
      if installed == true {
        NSLog("The helper is already installed.")
        self.setValue(true, forKey: self.helperIsInstalledKeyPath)
        return
      }
      
      NSLog("Example::: Install the helper.")
      do {
        if try self.helperInstall() {
          NSLog("Helper installed successfully.")
          self.setValue(true, forKey: self.helperIsInstalledKeyPath)
          return
        } else {
          NSLog("Failed install helper with unknown error.")
        }
      } catch {
        NSLog("Failed to install helper with error: \(error)")
        //                self.exitApp()
      }
      
      self.setValue(false, forKey: self.helperIsInstalledKeyPath)
    }
  }
}

