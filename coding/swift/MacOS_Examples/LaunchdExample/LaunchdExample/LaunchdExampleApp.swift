//
//  LaunchdExampleApp.swift
//  LaunchdExample
//
//  Created by 문철현 on 11/7/23.
//

import SwiftUI

@main
struct LaunchdExampleApp: App {
  @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
  
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}
