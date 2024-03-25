//
//  Tab2View.swift
//  TabLinkNavigatorPractice
//
//  Created by 문철현 on 3/25/24.
//

import SwiftUI
import LinkNavigator

struct Tab2View: View {
//  @ObservedObject var viewModel: Tab2View.ViewModel
  
//  init(viewModel: Tab2View.ViewModel) {
//    self._viewModel = ObservedObject(wrappedValue: viewModel)
//  }
  
  @StateObject var viewModel: Tab2View.ViewModel
  
  init(viewModel: Tab2View.ViewModel) {
    self._viewModel = StateObject(wrappedValue: viewModel)
  }
  
  var body: some View {
    VStack {
      Text("Tab2 View")
        .padding()
    }
  }
}
