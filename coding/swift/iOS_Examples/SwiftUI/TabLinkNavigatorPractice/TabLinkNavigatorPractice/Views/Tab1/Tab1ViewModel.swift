//
//  Tab1ViewModel.swift
//  TabLinkNavigatorPractice
//
//  Created by 문철현 on 3/25/24.
//

import Foundation

extension Tab1View {
  final class ViewModel: ObservableObject {
    let navigator: TabNavigatorType
    
    init(navigator: TabNavigatorType) {
      self.navigator = navigator
      print("Tab 1 ViewModel init")
    }
    
    deinit {
      print("Tab 1 ViewModel De-init")
    }
  }
}
