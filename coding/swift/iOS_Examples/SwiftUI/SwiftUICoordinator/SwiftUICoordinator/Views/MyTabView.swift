//
//  MyTabView.swift
//  SwiftUICoordinator
//
//  Created by 문철현 on 2023/10/11.
//

import SwiftUI

struct MyTabView: View {
  @StateObject var coordinator = Coordinator()
  
  var body: some View {
    TabView {
      HelloView()
        .tabItem {
          Label("Hello", systemImage: "hand.wave")
        }
      
      WorldView()
        .tabItem {
          Label("World", systemImage: "network")
        }
    }
    .navigationBarBackButtonHidden(true)
  }
}

struct MyTabView_Previews: PreviewProvider {
  static var previews: some View {
    MyTabView()
  }
}
