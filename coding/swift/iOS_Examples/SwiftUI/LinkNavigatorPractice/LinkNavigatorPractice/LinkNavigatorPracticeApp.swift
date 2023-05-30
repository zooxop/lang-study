//
//  LinkNavigatorPracticeApp.swift
//  LinkNavigatorPractice
//
//  Created by 문철현 on 2023/05/30.
//
//  코드 및 설명 출처 : https://dokit.tistory.com/44#header-2

import SwiftUI
import LinkNavigator

@main
struct LinkNavigatorPracticeApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    var navigator: LinkNavigator {
        appDelegate.navigator
    }
    
    var body: some Scene {
        WindowGroup {
            navigator
                .launch(paths: ["home"], items: [:])  // paths 파라메터의 인자가 시작 페이지가 된다.
                .onOpenURL { url in
                    // 딥링크 기능 사용시 작성.
                }
        }
    }
}
