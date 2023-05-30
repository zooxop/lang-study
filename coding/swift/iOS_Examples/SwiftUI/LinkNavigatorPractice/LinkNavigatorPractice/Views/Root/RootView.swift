//
//  RootView.swift
//  LinkNavigatorPractice
//
//  Created by 문철현 on 2023/05/30.
//

import SwiftUI
import LinkNavigator

struct RootView: View {
    let navigator: LinkNavigatorType
    
    var body: some View {
        TabView {
            HomeView(navigator: navigator)
                .tabItem {
                    Image(systemName: "house")
                    Text("홈")
                }
//            NextView(preventViewModel: NextViewModel(navigator: navigator))
            NextView(viewModel: NextViewModel(navigator: navigator))
                .tabItem {
                    Image(systemName: "brain.head.profile")
                    Text("예방")
                }
            Text("설정 부분")
                .tabItem{
                    Image(systemName: "gear")
                    Text("설정")
                }
        }
    }
}
