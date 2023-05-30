//
//  AppRouterGroup.swift
//  LinkNavigatorPractice
//
//  Created by 문철현 on 2023/05/30.
//

import LinkNavigator

struct AppRouterGroup {
    var routers: [RouteBuilder] {
        [
            HomeRouteBuilder(),
            NextRouteBuilder(),
        ]
    }
}
