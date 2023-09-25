//
//  OnBoardingExampleApp.swift
//  OnBoardingExample
//
//  Created by 문철현 on 2023/09/25.
//

import SwiftUI

@main
struct OnBoardingExampleApp: App {
  @AppStorage("isOnboarding") var isOnboarding: Bool = true
  
  var body: some Scene {
    WindowGroup {
      if isOnboarding {
        OnBoardingView()
      } else {
        ContentView()
      }
    }
  }
}
