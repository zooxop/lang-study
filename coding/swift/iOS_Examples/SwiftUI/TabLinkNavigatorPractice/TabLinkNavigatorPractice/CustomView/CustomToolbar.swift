//
//  CustomToolbar.swift
//  TabLinkNavigatorPractice
//
//  Created by 문철현 on 3/25/24.
//

import SwiftUI
import LinkNavigator

struct CustomToolbar: ToolbarContent {
  let navigator: SingleNavigatorType
  
  var body: some ToolbarContent {
    ToolbarItem(placement: .topBarLeading) {
      Button {
        navigator.backToLast(path: "login", isAnimated: true)
      } label: {
        Image(systemName: "arrow.left")
      }
    }
  }
}
