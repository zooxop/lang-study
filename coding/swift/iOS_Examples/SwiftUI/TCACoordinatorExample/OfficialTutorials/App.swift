//
//  TCACoordinatorExampleApp.swift
//  TCACoordinatorExample
//
//  Created by 문철현 on 2023/08/28.
//

import ComposableArchitecture
import SwiftUI
import TCACoordinators

@main
struct TCACoordinatorExampleApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabCoordinatorView(
                store: Store(initialState: .initialState) {
                    MainTabCoordinator()
                }
            )
        }
    }
}
