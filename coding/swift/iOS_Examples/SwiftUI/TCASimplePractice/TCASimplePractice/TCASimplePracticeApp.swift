//
//  TCASimplePracticeApp.swift
//  TCASimplePractice
//
//  Created by 문철현 on 2023/08/22.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCASimplePracticeApp: App {
    var body: some Scene {
        WindowGroup {
            FeatureView(
                store: Store(initialState: Feature.State()) {
                    Feature()
                }
            )
        }
    }
}
