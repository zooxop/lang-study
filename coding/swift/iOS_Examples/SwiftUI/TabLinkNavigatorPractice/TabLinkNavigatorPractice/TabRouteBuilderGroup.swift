//
//  TabRouteBuilderGroup.swift
//  TabLinkNavigatorPractice
//
//  Created by 문철현 on 3/25/24.
//

import LinkNavigator

public typealias TabNavigatorType = LinkNavigatorFindLocationUsable & TabLinkNavigatorProtocol

struct TabRouteBuilderGroup<RootNavigator: TabNavigatorType> {
  init() { }
  
  var routers: [RouteBuilderOf<RootNavigator>] {
    [
      Tab1RouteBuilder.generate(),
      Tab2RouteBuilder.generate()
    ]
  }
}
