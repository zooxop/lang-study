//
//  HotKeyTestApp.swift
//  HotKeyTest
//
//  Created by 문철현 on 2023/10/19.
//

import SwiftUI
import HotKey

@main
struct HotKeyTestApp: App {
  
  init() {
    let hotKey = HotKey(key: .r, modifiers: [.command, .option], keyDownHandler: {NSApp.activate(ignoringOtherApps: true)})
  }
  
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}
