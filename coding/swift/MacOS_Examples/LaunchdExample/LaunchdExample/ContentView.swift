//
//  ContentView.swift
//  LaunchdExample
//
//  Created by 문철현 on 11/7/23.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      Button {
        
      } label: {
        HStack {
          Image(systemName: "helm")
            .imageScale(.large)
            .foregroundStyle(.tint)
          
          Text("Helper Install & Start")
        }
      }
      .padding()
      
      Button {
        
      } label: {
        HStack {
          Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
          
          Text("Launch Daemon Install & Start")
        }
      }
      .padding()
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
