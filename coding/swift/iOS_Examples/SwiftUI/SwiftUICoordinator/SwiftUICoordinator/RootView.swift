//
//  RootView.swift
//  SwiftUICoordinator
//
//  Created by 문철현 on 2023/10/10.
//

import SwiftUI

struct RootView: View {
  var body: some View {
    NavigationView {
      SignInView()
    }
  }
}

struct RootView_Previews: PreviewProvider {
  static var previews: some View {
    RootView()
  }
}
