//
//  SOFNavigationToolBarApp.swift
//  SOFNavigationToolBar
//
//  Created by 문철현 on 2023/05/16.
//

import SwiftUI

@main
struct SOFNavigationToolBarApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TabView {
                    GPNavigationPreview()
                        .tabItem {
                            Image(systemName: "house")
                            Text("home")
                        }
                    SwiftUIView()
                        .tabItem {
                            Image(systemName: "house")
                            Text("home")
                        }
                }
            }
        }
    }
}
