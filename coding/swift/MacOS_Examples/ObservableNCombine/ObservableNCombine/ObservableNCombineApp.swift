//
//  ObservableNCombineApp.swift
//  ObservableNCombine
//
//  Created by 문철현 on 2023/10/24.
//

import SwiftUI

@main
struct ObservableNCombineApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView(viewModel: DIContainer.shared.firstObject)
    }
  }
}
