//
//  ContentView.swift
//  TwitterSplitViewClone
//
//  Created by 문철현 on 11/22/23.
//

import SwiftUI

struct ContentView: View {
  @State private var columnVisibility =
  NavigationSplitViewVisibility.all

  var body: some View {
    NavigationSplitView(columnVisibility: $columnVisibility) {
      Sidebar()
        .navigationSplitViewColumnWidth(200)
    } detail: {
      Detail()
    }
    .navigationSplitViewStyle(.balanced)
  }
}

struct Sidebar: View {
  var body: some View {
    Text("SideBar")
      .padding()
  }
}

struct InspectorView: View {
  
  
  var body: some View {
    Text("Content")
      .padding()
  }
}

struct Detail: View {
  @State private var showInspector: Bool = true
  
  var body: some View {
    VStack {
      Text("DetailView")
        .padding()
      
      Button("Show/Hide Inspector") {
        self.showInspector.toggle()
      }
      
    }
    .inspector(isPresented: $showInspector) {
      InspectorView()
    }
  }
}

#Preview {
  ContentView()
}
