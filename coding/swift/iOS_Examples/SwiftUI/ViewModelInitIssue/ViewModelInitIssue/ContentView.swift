//
//  ContentView.swift
//  ViewModelInitIssue
//
//  Created by 문철현 on 2023/10/18.
//

import SwiftUI

struct ContentView: View {
  @State var offset = false
  
  var body: some View {
    VStack {
      InnerView()
        //.offset(x: offset ? 200 : 0)
      
      Text("asdf")
        .offset(x: offset ? 200 : 0)
      
      Button("Offset") {
        offset.toggle()
      }
    }
    .padding()
  }
}

struct InnerView: View {
  
  @StateObject var viewModel: ViewModel
  
  @State var innerOffset = false
  
  init() {
    self._viewModel = StateObject(wrappedValue: ViewModel())
    print("????")
  }
  
  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
      Text("Hello, world!")
      
      Button("Inner offset") {
        innerOffset.toggle()
      }
    }
    .onAppear {
      print("onAppear")
    }
    .onDisappear {
      print("onDisappear")
    }
    .offset(x: innerOffset ? 100 : 0)
    .padding()
  }
}

class ViewModel: ObservableObject, Identifiable {
  var id: Int = 0
  init() {
    print("ViewModel Init")
  }
}

struct OtherView: View {
  
  var body: some View {
    VStack {
      Text("test")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
