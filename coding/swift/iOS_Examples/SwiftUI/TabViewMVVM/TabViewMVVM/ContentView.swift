//
//  ContentView.swift
//  TabViewMVVM
//
//  Created by 문철현 on 3/25/24.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationStack {
      NavigationLink("TabView") {
        DummyTabView()
      }
    }
  }
}

#Preview {
  ContentView()
}


struct DummyTabView: View {
  
  var body: some View {
    TabView {
      FirstTabView(viewModel: FirstTabViewModel())
        .tabItem {
          Label("첫 번째", systemImage: "1.circle")
        }
      
      SecondTabView(viewModel: SecondTabViewModel())
        .tabItem {
          Label("두 번째", systemImage: "2.circle")
        }
    }
  }
}

// 첫 번째 탭의 View
struct FirstTabView: View {
  @ObservedObject var viewModel: FirstTabViewModel
  
  var body: some View {
    // 뷰의 내용
    Text("첫 번째 탭")
  }
}

// 두 번째 탭의 View
struct SecondTabView: View {
  @ObservedObject var viewModel: SecondTabViewModel
  
  var body: some View {
    // 뷰의 내용
    Text("두 번째 탭")
  }
}


// 첫 번째 탭의 ViewModel
class FirstTabViewModel: ObservableObject {
  // ViewModel의 속성 및 메서드
  init() {
    print("First Init")
  }
  
  deinit {
    print("First De-Init")
  }
}

// 두 번째 탭의 ViewModel
class SecondTabViewModel: ObservableObject {
  // ViewModel의 속성 및 메서드
  init() {
    print("Second Init")
  }
  
  deinit {
    print("Second De-Init")
  }
}
