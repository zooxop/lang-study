//
//  HomeView.swift
//  LinkNavigatorPractice
//
//  Created by 문철현 on 2023/05/30.
//

import SwiftUI
import LinkNavigator

struct HomeView: View {
    let navigator: LinkNavigatorType
    
    init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
    
    var body: some View {
        VStack {
            Text("Home View")
                .font(.title)
            Button {
                navigator.next(paths: ["next"], items: [:], isAnimated: true)
            } label: {
                Text("Next View")
            }
        }
    }
}
