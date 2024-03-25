//
//  Tab1View.swift
//  TabLinkNavigatorPractice
//
//  Created by 문철현 on 3/25/24.
//

import SwiftUI
import LinkNavigator

struct Tab1View: View {
  @ObservedObject var viewModel: Tab1View.ViewModel
  
  init(viewModel: Tab1View.ViewModel) {
    self._viewModel = ObservedObject(wrappedValue: viewModel)
  }
  
  var body: some View {
    VStack {
      Text("Tab1 View")
        .padding()
    }
  }
}
