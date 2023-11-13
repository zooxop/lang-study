//
//  FCMExample_macApp.swift
//  FCMExample-mac
//
//  Created by 문철현 on 11/13/23.
//

import SwiftUI

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
struct FCMExample_macApp: App {
  @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
  
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}
