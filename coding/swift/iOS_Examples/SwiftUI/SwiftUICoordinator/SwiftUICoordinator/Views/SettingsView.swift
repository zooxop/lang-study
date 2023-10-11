//
//  SettingsView.swift
//  SwiftUICoordinator
//
//  Created by 문철현 on 2023/10/11.
//

import SwiftUI

struct SettingsView: View {
  @StateObject var coordinator = Coordinator()
  
  var body: some View {
    VStack {
      coordinator.navigationLinkSection()
      
      Button {
        coordinator.popToRoot()
      } label: {
        Text("Sign out")
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .ignoresSafeArea()
    .background(Color.green.opacity(0.2))
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
  }
}
