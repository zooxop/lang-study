//
//  MainView.swift
//  TabLinkNavigatorPractice
//
//  Created by 문철현 on 3/25/24.
//

import SwiftUI
import LinkNavigator

struct MainView: View {
  let navigator: SingleNavigatorType
  
  let tabLinkNavigator = TabLinkNavigator(
    routeBuilderItemList: TabRouteBuilderGroup().routers,
    dependency: AppDependency()
  )
  
  var body: some View {
    TabLinkNavigationView(
      linkNavigator: tabLinkNavigator,
      isHiddenDefaultTabbar: false,
      tabItemList: [
        .init(tag: .zero,
              tabItem: .init(
                title: "tab1",
                image: UIImage(systemName: "house"),
                selectedImage: UIImage(systemName: "house.fill")
              ),
              linkItem: .init(path: "tab1")),
        .init(tag: 1,
              tabItem: .init(
                title: "tab2",
                image: UIImage(systemName: "folder"),
                selectedImage: UIImage(systemName: "folder.fill")
              ),
              linkItem: .init(path: "tab2")),
      ]
    )
    .navigationBarBackButtonHidden()
    .toolbar { CustomToolbar(navigator: navigator) }
  }
}
