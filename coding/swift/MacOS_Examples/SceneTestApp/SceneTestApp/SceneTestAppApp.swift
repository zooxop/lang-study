//
//  SceneTestAppApp.swift
//  SceneTestApp
//
//  Created by 문철현 on 4/12/24.
//

import SwiftUI

@main
struct SceneTestAppApp: App {
  @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .onOpenURL { url in
          print(url)
        }
        .handlesExternalEvents(
          preferring: Set(arrayLiteral: "scene-test"),
          allowing: Set(arrayLiteral: "*")
        )
    }
    .handlesExternalEvents(matching: Set(arrayLiteral: "scene-test"))
  }
}
