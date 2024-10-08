//
//  FCMExampleApp.swift
//  FCMExample
//
//  Created by 문철현 on 2023/11/02.
//

import SwiftUI
//import FirebaseCore
//import FirebaseMessaging

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
