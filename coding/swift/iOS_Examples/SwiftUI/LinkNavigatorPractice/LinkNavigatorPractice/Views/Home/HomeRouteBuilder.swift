//
//  HomeRouteBuilder.swift
//  LinkNavigatorPractice
//
//  Created by 문철현 on 2023/05/30.
//

import LinkNavigator
import SwiftUI

struct HomeRouteBuilder: RouteBuilder {
    var matchPath: String { "home" }  // 화면 전환에 필요한 Path
    
    var build: (LinkNavigatorType, [String: String], DependencyType) -> MatchingViewController? {
        { navigator, items, dependency in
            return WrappingController(matchPath: matchPath) {
                HomeView(navigator: navigator) // ✅ 화면 전환할 SwiftUI View
            }
        }
    }
}
