//
//  AppDelegate.swift
//  LinkNavigatorPractice
//
//  Created by 문철현 on 2023/05/30.
//

import SwiftUI
import LinkNavigator

// 외부 의존성과 화면을 주입받은 navigator를 관리하는 타입
final class AppDelegate: NSObject {
    var navigator: LinkNavigator {
        LinkNavigator(dependency: AppDependency(), builders: AppRouterGroup().routers)
    }
}

extension AppDelegate: UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
}
