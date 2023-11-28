//
//  ContentView.swift
//  SheetAccentColorTest
//
//  Created by 문철현 on 11/28/23.
//

import SwiftUI

struct ContentView: View {
  @State var isShow: Bool = false
  
  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
        .onTapGesture {
          self.isShow.toggle()
        }
        .accentColor(.red)
      Text("Hello, world!")
      Spacer()
    }
    .tint(.accentColor)
    .accentColor(.accentColor)
    .padding()
    .sheet(isPresented: self.$isShow) {
      Text("Hi")
    }
  }
}

#Preview {
  ContentView()
}
