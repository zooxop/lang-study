//
//  TabLinkNavigatorPracticeApp.swift
//  TabLinkNavigatorPractice
//
//  Created by 문철현 on 3/25/24.
//

import SwiftUI
import LinkNavigator

@main
struct TabLinkNavigatorPracticeApp: App {

  let singleNavigator = SingleLinkNavigator(
    routeBuilderItemList: SingleRouteBuilderGroup().routers,
    dependency: AppDependency())
  
  var body: some Scene {
    WindowGroup {
      LinkNavigationView(linkNavigator: singleNavigator, item: .init(path: "login"))
        .ignoresSafeArea()
    }
  }
}
