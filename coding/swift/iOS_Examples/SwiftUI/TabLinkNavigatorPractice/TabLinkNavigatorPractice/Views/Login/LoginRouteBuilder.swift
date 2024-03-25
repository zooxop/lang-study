//
//  LoginRouteBuilder.swift
//  TabLinkNavigatorPractice
//
//  Created by 문철현 on 3/25/24.
//

import SwiftUI
import LinkNavigator

struct LoginRouteBuilder<RootNavigator: SingleNavigatorType> {
  
  static func generate() -> RouteBuilderOf<RootNavigator> {
    var matchPath: String { "login" }
    return .init(matchPath: matchPath) { navigator, _, _ -> RouteViewController? in
      WrappingController(matchPath: matchPath, title: "") {
        LoginView(navigator: navigator)
      }
    }
  }
}
