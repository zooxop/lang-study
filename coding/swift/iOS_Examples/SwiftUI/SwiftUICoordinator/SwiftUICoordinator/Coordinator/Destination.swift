//
//  Destination.swift
//  SwiftUICoordinator
//
//  Created by 문철현 on 2023/10/10.
//

import SwiftUI

enum Destination {
  //case signIn
  case tabView
  case settings
  
  @ViewBuilder
  var view: some View {
    switch self {
//    case .signIn:
//      SignInView()
    case .tabView:
      MyTabView()
    case .settings:
      SettingsView()
    }
  }
}
