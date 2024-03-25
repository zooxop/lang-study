//
//  Tab2ViewModel.swift
//  TabLinkNavigatorPractice
//
//  Created by 문철현 on 3/25/24.
//

import Foundation

extension Tab2View {
  final class ViewModel: ObservableObject {
    //let navigator: TabNavigatorType
    
    //init(navigator: TabNavigatorType) {
    init() {
      //self.navigator = navigator
      print("Tab 2 ViewModel init")
    }
    
    deinit {
      print("Tab 2 ViewModel De-init")
    }
  }
}
