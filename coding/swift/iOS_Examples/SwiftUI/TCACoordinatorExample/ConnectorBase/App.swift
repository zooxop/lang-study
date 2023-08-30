//
//  ConnectorBaseApp.swift
//  ConnectorBase
//
//  Created by 문철현 on 2023/08/29.
//

import SwiftUI
import ComposableArchitecture

@main
struct ConnectorBaseApp: App {
  var body: some Scene {
    WindowGroup {
      CoordinatorView(
        store: Store(initialState: .initialState) {
          Coordinator()
        }
      )
    }
  }
}
