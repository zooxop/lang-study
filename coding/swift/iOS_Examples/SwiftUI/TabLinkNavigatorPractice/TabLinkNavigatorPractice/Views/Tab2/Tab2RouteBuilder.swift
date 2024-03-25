//
//  Tab2RouteBuilder.swift
//  TabLinkNavigatorPractice
//
//  Created by 문철현 on 3/25/24.
//

import SwiftUI
import LinkNavigator

struct Tab2RouteBuilder<RootNavigator: TabNavigatorType> {
  
  static func generate() -> RouteBuilderOf<RootNavigator> {
    var matchPath: String { "tab2" }
    
    return .init(matchPath: matchPath) { navigator, _, _ -> RouteViewController? in
      WrappingController(matchPath: matchPath, title: "") {
        //Tab2View(viewModel: .init(navigator: navigator))
        Tab2View(viewModel: .init())
        //Tab2View()
      }
    }
  }
}
