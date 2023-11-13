//
//  Helper.swift
//  ExamplePrivilegedHelper
//
//  Created by 문철현 on 11/10/23.
//

import Foundation

class Helper: NSObject, NSXPCListenerDelegate, HelperProtocol {
  
  // MARK: - Private Constant Variables
  private let listener: NSXPCListener
  
  // MARK: - Private Variables
  private var connections = [NSXPCConnection]()
  private var shouldQuit = false
  private var shouldQuitCheckInterval = 1.0
  
  var vpnProcess: Process?
  
  // MARK: -
  // MARK: Initialization
  
  override init() {
    self.listener = NSXPCListener(machServiceName: HelperConstants.machServiceName)
    super.init()
    self.listener.delegate = self
  }
  
  public func run() {
    self.listener.resume()
    
    // Keep the helper tool running until the variable shouldQuit is set to true.
    // The variable should be changed in the "listener(_ listener:shoudlAcceptNewConnection:)" function.
    // `shouldQuit` 변수값이 true로 바뀔때까지는 helper tool을 running 상태로 유지시켜준다.
    // "listener(_ listener:shoudlAcceptNewConnection:)" function 안쪽에서 변수값이 변경될 수 있다.
    while !self.shouldQuit {
      RunLoop.current.run(until: Date(timeIntervalSinceNow: self.shouldQuitCheckInterval))
    }
  }
  
  // MARK: -
  // MARK: NSXPCListenerDelegate Methods
  
  func listener(_ listener: NSXPCListener, shouldAcceptNewConnection connection: NSXPCConnection) -> Bool {
    
    // Verify that the calling application is signed using the same code signing certificate as the helper
    guard self.isValid(connection: connection) else {
      return false
    }
    
    // Set the protocol that the calling application conforms to.
    connection.remoteObjectInterface = NSXPCInterface(with: AppProtocol.self)
    
    // Set the protocol that the helper conforms to.
    connection.exportedInterface = NSXPCInterface(with: HelperProtocol.self)
    connection.exportedObject = self
    
    // Set the invalidation handler to remove this connection when it's work is completed.
    connection.invalidationHandler = {
      if let connectionIndex = self.connections.firstIndex(of: connection) {
        self.connections.remove(at: connectionIndex)
      }
      
      if self.connections.isEmpty {
        self.shouldQuit = true
      }
    }
    
    self.connections.append(connection)
    connection.resume()
    
    return true
  }
  
  // MARK: -
  // MARK: HelperProtocol Methods
  
  func getVersion(completion: (String) -> Void) {
    completion(helperVersion)
  }
  
  func runCommandLs(withPath path: String, completion: @escaping (NSNumber) -> Void) {
    
    // For security reasons, all commands should be hardcoded in the helper
    let command = "/bin/ls"
    let arguments = [path]
    
    //        let command = "/sbin/route"
    ////        let arguments = ["add", "-net", "121.254.143.180", "-netmask", "255.255.255.255", "192.168.0.1"]
    //        let arguments = ["delete", "-net", "121.254.143.180"]
    
    // Run the task
    self.runTask(command: command, arguments: arguments, completion: completion)
  }
  
  func runCommandLs(withPath path: String, authData: NSData?, completion: @escaping (NSNumber) -> Void) {
    
    // Check the passed authorization, if the user need to authenticate to use this command the user might be prompted depending on the settings and/or cached authentication.
    
    guard self.verifyAuthorization(authData, forCommand: #selector(HelperProtocol.runCommandLs(withPath:authData:completion:))) else {
      completion(kAuthorizationFailedExitCode)
      return
    }
    
    self.runCommandLs(withPath: path, completion: completion)
  }
  
  // MARK: - Private Helper Methods
  
  private func isValid(connection: NSXPCConnection) -> Bool {
    do {
      return try CodesignCheck.codeSigningMatches(pid: connection.processIdentifier)
    } catch {
      NSLog("Code signing check failed with error: \(error)")
      return false
    }
  }
  
  private func verifyAuthorization(_ authData: NSData?, forCommand command: Selector) -> Bool {
    do {
      try HelperAuthorization.verifyAuthorization(authData, forCommand: command)
    } catch {
      if let remoteObject = self.connection()?.remoteObjectProxy as? AppProtocol {
        remoteObject.log(stdErr: "Authentication Error: \(error)")
      }
      return false
    }
    return true
  }
  
  private func connection() -> NSXPCConnection? {
    return self.connections.last
  }
  
  private func runCommand2(_ command: String) -> (Bool, String) {
    let task = Process()
    let outPipe = Pipe()
    let errorPipe = Pipe()
    
    task.standardOutput = outPipe
    task.standardError = errorPipe
    task.arguments = ["-c", command]
    task.launchPath = "/bin/zsh"
    task.standardInput = nil
    task.launch()
    
    let outData = outPipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: outData, encoding: .utf8)!
    
    let errorData = errorPipe.fileHandleForReading.readDataToEndOfFile()
    let error = String(data: errorData, encoding: .utf8)!
    
    if error.isEmpty {
      return (true, output)
    }
    
    return (false, error)
  }
  
  private func runCommand(_ command: String) -> String {
    let task = Process()
    let pipe = Pipe()
    
    task.standardOutput = pipe
    task.standardError = pipe
    task.arguments = ["-c", command]
    task.launchPath = "/bin/zsh"
    task.standardInput = nil
    task.launch()
    
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: data, encoding: .utf8)!
    
    return output
  }
  
  private func runTask(command: String, arguments: Array<String>, completion:@escaping ((NSNumber) -> Void)) -> Void {
    let task = Process()
    let stdOut = Pipe()
    
    let stdOutHandler =  { (file: FileHandle!) -> Void in
      let data = file.availableData
      guard let output = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return }
      if let remoteObject = self.connection()?.remoteObjectProxy as? AppProtocol {
        remoteObject.log(stdOut: output as String)
      }
    }
    stdOut.fileHandleForReading.readabilityHandler = stdOutHandler
    
    let stdErr:Pipe = Pipe()
    let stdErrHandler =  { (file: FileHandle!) -> Void in
      let data = file.availableData
      guard let output = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return }
      if let remoteObject = self.connection()?.remoteObjectProxy as? AppProtocol {
        remoteObject.log(stdErr: output as String)
      }
    }
    stdErr.fileHandleForReading.readabilityHandler = stdErrHandler
    
    if let remoteObject = self.connection()?.remoteObjectProxy as? AppProtocol {
      remoteObject.log(stdOut: "Set Command")
    }
    
    task.launchPath = command
    task.arguments = arguments
    task.standardOutput = stdOut
    task.standardError = stdErr
    
    task.terminationHandler = { task in
      completion(NSNumber(value: task.terminationStatus))
    }
    
    task.launch()
  }
  
}

