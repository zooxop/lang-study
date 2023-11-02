//
//  FCMExampleApp.swift
//  FCMExample
//
//  Created by 문철현 on 2023/11/02.
//

import SwiftUI
import FirebaseCore
import FirebaseMessaging

class StateManager: ObservableObject {
  public static let shared: StateManager = .init()

  @Published private(set) var value = 0
  
  private init() {
    
  }
  
  public func increase() {
    NotificationCenter.default.post(
      name: Notification.Name("Increase"),
      object: nil
    )
  }
}

class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  let gcmMessageIDKey = "gcm.message_id"

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication
                     .LaunchOptionsKey: Any]?) -> Bool {
    FirebaseApp.configure()

    // [START set_messaging_delegate]
    Messaging.messaging().delegate = self
    // [END set_messaging_delegate]

    // Register for remote notifications. This shows a permission dialog on first run, to
    // show the dialog at a more appropriate time move this registration accordingly.
    // [START register_for_notifications]

    UNUserNotificationCenter.current().delegate = self

    let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
    UNUserNotificationCenter.current().requestAuthorization(
      options: authOptions,
      completionHandler: { _, _ in }
    )

    application.registerForRemoteNotifications()

    // [END register_for_notifications]

    return true
  }

  func application(_ application: UIApplication,
                   didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
    // If you are receiving a notification message while your app is in the background,
    // this callback will not be fired till the user taps on the notification launching the application.
    // TODO: Handle data of notification

    // With swizzling disabled you must let Messaging know about the message, for Analytics
    // Messaging.messaging().appDidReceiveMessage(userInfo)

    // Print message ID.
    if let messageID = userInfo[gcmMessageIDKey] {
      print("Message ID: \(messageID)")
    }

    // Print full message.
    print(userInfo)
  }

  // [START receive_message]
  func application(_ application: UIApplication,
                   didReceiveRemoteNotification userInfo: [AnyHashable: Any]) async
    -> UIBackgroundFetchResult {
    // If you are receiving a notification message while your app is in the background,
    // this callback will not be fired till the user taps on the notification launching the application.
    // TODO: Handle data of notification

    // With swizzling disabled you must let Messaging know about the message, for Analytics
    // Messaging.messaging().appDidReceiveMessage(userInfo)

    // Print message ID.
    if let messageID = userInfo[gcmMessageIDKey] {
      print("Message ID: \(messageID)")
    }

    // Print full message.
    print(userInfo)

    return UIBackgroundFetchResult.newData
  }

  // [END receive_message]

  func application(_ application: UIApplication,
                   didFailToRegisterForRemoteNotificationsWithError error: Error) {
    print("Unable to register for remote notifications: \(error.localizedDescription)")
  }

  // This function is added here only for debugging purposes, and can be removed if swizzling is enabled.
  // If swizzling is disabled then this function must be implemented so that the APNs token can be paired to
  // the FCM registration token.
  func application(_ application: UIApplication,
                   didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    print("APNs token retrieved: \(deviceToken)")

    // With swizzling disabled you must set the APNs token here.
    // Messaging.messaging().apnsToken = deviceToken
  }
}

extension AppDelegate: UNUserNotificationCenterDelegate, MessagingDelegate {
  /// 푸시클릭시
  func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse) async {
    print("🟢", #function)
  }
  
  /// 앱화면 보고있는중에 푸시올 때
  func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification) async -> UNNotificationPresentationOptions {
    print("🟢", #function)
    StateManager.shared.increase()
    //return [.sound, .banner, .list]
    return [.list]
  }
  
  /// FCMToken 업데이트시
  func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
    print("Firebase registration token: \(String(describing: fcmToken))")

    let dataDict: [String: String] = ["token": fcmToken ?? ""]
    NotificationCenter.default.post(
      name: Notification.Name("FCMToken"),
      object: nil,
      userInfo: dataDict
    )
  }
}


@main
struct FCMExampleApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}
