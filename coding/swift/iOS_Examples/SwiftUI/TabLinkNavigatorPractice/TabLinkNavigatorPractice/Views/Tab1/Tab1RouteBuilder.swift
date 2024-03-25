//
//  Tab1RouteBuilder.swift
//  TabLinkNavigatorPractice
//
//  Created by 문철현 on 3/25/24.
//

import SwiftUI
import LinkNavigator

struct Tab1RouteBuilder<RootNavigator: TabNavigatorType> {
  
  static func generate() -> RouteBuilderOf<RootNavigator> {
    var matchPath: String { "tab1" }
    return .init(matchPath: matchPath) { navigator, _, _ -> RouteViewController? in
      WrappingController(matchPath: matchPath, title: "") {
        Tab1View(viewModel: .init(navigator: navigator))
      }
    }
  }
}
