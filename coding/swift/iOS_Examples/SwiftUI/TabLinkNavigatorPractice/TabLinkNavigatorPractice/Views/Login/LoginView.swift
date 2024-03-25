//
//  LoginView.swift
//  TabLinkNavigatorPractice
//
//  Created by 문철현 on 3/25/24.
//

import SwiftUI
import LinkNavigator

struct LoginView: View {
  let navigator: SingleNavigatorType
  
  var body: some View {
    VStack {
      Text("LoginView")
        .padding()
      
      Button("Go to TabView") {
        navigator.next(linkItem: .init(path: "main"), isAnimated: false)
      }
    }
  }
}
