//
//  ContentView.swift
//  ViewParam
//
//  Created by 문철현 on 2023/09/20.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundColor(.accentColor)
      
      Text("Hello, world!")
      
      ViewParamView {
        //EmptyView()
        Text("View 어떤 형식이든 넣을 수 있음.")
      }

    }
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct ViewParamView<Content>: View where Content: View {
  var label: Content
  
  public init(@ViewBuilder content: () -> Content) {
    self.label = content()
  }

  public var body: some View {
    self.label
  }
}
