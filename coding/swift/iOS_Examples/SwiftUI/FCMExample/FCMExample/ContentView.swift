//
//  ContentView.swift
//  FCMExample
//
//  Created by 문철현 on 2023/11/02.
//

import SwiftUI

struct ContentView: View {
  @StateObject var viewModel = ContentViewModel()
  
  var body: some View {
    VStack {
      Text("\(self.viewModel.value)")
        .font(.largeTitle)
    }
    .padding()
  }
}

class ContentViewModel: ObservableObject {
  
  @Published var value: Int = 0
  
  init() {
    // 옵저버 등록
    NotificationCenter.default.addObserver(self, selector: #selector(didRecieveTestNotification(_:)), name: NSNotification.Name("Increase"), object: nil)
  }
  
  @objc func didRecieveTestNotification(_ notification: Notification) {
    print("Test Notification")
    DispatchQueue.main.async {
      self.value += 1
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
