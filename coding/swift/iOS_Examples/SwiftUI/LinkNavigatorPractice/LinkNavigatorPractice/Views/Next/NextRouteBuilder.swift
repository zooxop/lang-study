//
//  NextRouteBuilder.swift
//  LinkNavigatorPractice
//
//  Created by 문철현 on 2023/05/30.
//

import LinkNavigator
import SwiftUI

struct NextRouteBuilder: RouteBuilder {
    var matchPath: String { "next" }
    
    var build: (LinkNavigatorType, [String: String], DependencyType) -> MatchingViewController? {
        { navigator, items, dependency in
            return WrappingController(matchPath: matchPath) {
                NextView(preventViewModel: NextViewModel(navigator: navigator)) // ✅ ViewModel (MVVM)
            }
        }
    }
}
