//
//  KickSaferApp.swift
//  KickSafer
//
//  Created by 문철현 on 11/15/23.
//

import SwiftUI

@main
struct KickSaferApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}
