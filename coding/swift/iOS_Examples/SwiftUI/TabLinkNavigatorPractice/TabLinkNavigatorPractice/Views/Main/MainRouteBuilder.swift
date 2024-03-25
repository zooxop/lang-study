//
//  MainRouteBuilder.swift
//  TabLinkNavigatorPractice
//
//  Created by 문철현 on 3/25/24.
//

import SwiftUI
import LinkNavigator

struct MainRouteBuilder<RootNavigator: SingleNavigatorType> {
  
  static func generate() -> RouteBuilderOf<RootNavigator> {
    var matchPath: String { "main" }
    return .init(matchPath: matchPath) { navigator, _, _ -> RouteViewController? in
      WrappingController(matchPath: matchPath, title: "") {
        MainView(navigator: navigator)
      }
    }
  }
}
