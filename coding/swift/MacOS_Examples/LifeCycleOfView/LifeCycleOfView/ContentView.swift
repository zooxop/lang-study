//
//  ContentView.swift
//  LifeCycleOfView
//
//  Created by 문철현 on 2023/10/27.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationView {
      VStack {
        List {
          NavigationLink {
            FirstView()
          } label: {
            Image(systemName: "globe")
              .imageScale(.large)
              .foregroundColor(.accentColor)
          }

          NavigationLink {
            SecondView()
          } label: {
            Image(systemName: "pencil")
              .imageScale(.large)
              .foregroundColor(.accentColor)
          }
        }
      }
    }
  }
}

struct FirstView: View {
  
  init() {
    print("First Init")
  }
  
  var body: some View {
    VStack {
      Text("First View")
      
      NavigationLink("Third") {
        ThirdView()
      }
    }
  }
}

struct SecondView: View {
  
  init() {
    print("Second Init")
  }
  
  var body: some View {
    VStack {
      Text("Second View")
    }
  }
}

struct ThirdView: View {
  @StateObject var viewModel = ModalViewModel()
  
  init() {
    print("Third Init")
  }
  
  var body: some View {
    VStack {
      Text("Third View")
    }
  }
}

class ModalViewModel: ObservableObject {
  
  init() {
    print("init")
  }
  
  deinit {
    print("deinit")
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
