//
//  RootRouteBuilder.swift
//  LinkNavigatorPractice
//
//  Created by 문철현 on 2023/05/30.
//

import Foundation
import LinkNavigator

struct RootRouteBuilder: RouteBuilder {
    var matchPath: String { "root" }
    
    var build: (LinkNavigatorType, [String : String], DependencyType) -> MatchingViewController? {
        { navigator, items, depedency in
            return WrappingController(matchPath: matchPath) {
                RootView(navigator: navigator)
            }
        }
    }
}
