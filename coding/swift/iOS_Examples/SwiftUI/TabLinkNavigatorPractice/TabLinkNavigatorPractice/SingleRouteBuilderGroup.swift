//
//  SingleRouteBuilderGroup.swift
//  TabLinkNavigatorPractice
//
//  Created by 문철현 on 3/25/24.
//

import LinkNavigator

public typealias SingleNavigatorType = LinkNavigatorFindLocationUsable & LinkNavigatorProtocol

struct SingleRouteBuilderGroup<RootNavigator: SingleNavigatorType> {
  init() { }
  
  var routers: [RouteBuilderOf<RootNavigator>] {
    [
      LoginRouteBuilder.generate(),
      MainRouteBuilder.generate(),
    ]
  }
}
