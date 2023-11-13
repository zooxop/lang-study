//
//  AppDelegate.swift
//  FCMExample
//
//  Created by 문철현 on 11/13/23.
//

import SwiftUI

class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    UNUserNotificationCenter.current().delegate = self

    let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
    UNUserNotificationCenter.current().requestAuthorization(
      options: authOptions,
      completionHandler: { _, _ in }
    )

    application.registerForRemoteNotifications()

    return true
  }

  func application(
    _ application: UIApplication,
    didFailToRegisterForRemoteNotificationsWithError error: Error
  ) {
    print("Unable to register for remote notifications: \(error.localizedDescription)")
  }

  func application(
    _ application: UIApplication,
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
    _ application: UIApplication,
    didReceiveRemoteNotification userInfo: [AnyHashable : Any],
    fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void
  ) {
    StateManager.shared.increase()
    print(userInfo)
    completionHandler(.newData)
  }
  
  /// 앱이 Foreground 상태일 때 호출.
  func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    willPresent notification: UNNotification
  ) async -> UNNotificationPresentationOptions {
    print("🟢", #function)
    StateManager.shared.increase()
    //return [.sound, .banner, .list]
    return [.list]
  }
  
  /// Push message를 클릭했을 때 호출
  func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    didReceive response: UNNotificationResponse
  ) async {
    StateManager.shared.increase()
    print("🟢", #function)
  }
}
