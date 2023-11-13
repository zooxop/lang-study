//
//  AppDelegate.swift
//  FCMExample-mac
//
//  Created by 문철현 on 11/13/23.
//

import SwiftUI
import FirebaseCore
import FirebaseMessaging

class AppDelegate: NSObject, NSApplicationDelegate {
  
  func applicationDidFinishLaunching(_ notification: Notification) {
    UNUserNotificationCenter.current().delegate = self

    let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
    UNUserNotificationCenter.current().requestAuthorization(
      options: authOptions,
      completionHandler: { _, _ in }
    )

    NSApplication.shared.registerForRemoteNotifications()
  }

  func application(
    _ application: NSApplication,
    didFailToRegisterForRemoteNotificationsWithError error: Error
  ) {
    print("Unable to register for remote notifications: \(error.localizedDescription)")
  }

  func application(
    _ application: NSApplication,
    didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
  ) {
    print("APNs token retrieved: \(deviceToken)")
    let deviceTokenString = deviceToken.map{ String(format: "%02x", $0) }.joined()
    print(deviceTokenString)
  }
}

// MARK: - Push Notification 수신
extension AppDelegate: UNUserNotificationCenterDelegate {
  
  /// Silent Push일 때만 호출.
  func application(
    _ application: NSApplication,
    didReceiveRemoteNotification userInfo: [String : Any]
  ) {
    StateManager.shared.increase()
    print(userInfo)
  }
  
  /// 푸시클릭시
  func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    didReceive response: UNNotificationResponse
  ) async {
    StateManager.shared.increase()
    print("🟢", #function)
  }
  
  /// 앱화면 보고있는중에 푸시올 때
  func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    willPresent notification: UNNotification
  ) async -> UNNotificationPresentationOptions {
    print("🟢", #function)
    StateManager.shared.increase()
    //return [.sound, .banner, .list]
    return [.list]
  }
}
