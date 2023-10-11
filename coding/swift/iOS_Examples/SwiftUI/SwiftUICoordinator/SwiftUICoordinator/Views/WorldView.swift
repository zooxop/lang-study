//
//  WorldView.swift
//  SwiftUICoordinator
//
//  Created by 문철현 on 2023/10/11.
//

import SwiftUI

struct WorldView: View {
  @StateObject var coordinator = Coordinator()
  
  var body: some View {
    VStack {
      coordinator.navigationLinkSection()
      Button {
        coordinator.push(destination: .settings)
      } label: {
        Text("Go to Settings View")
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .ignoresSafeArea()
    .background(Color.brown.opacity(0.2))
  }
}

struct WorldView_Previews: PreviewProvider {
  static var previews: some View {
    WorldView()
  }
}
