//
//  OnBoardingView.swift
//  OnBoardingExample
//
//  Created by 문철현 on 2023/09/25.
//

import SwiftUI

struct OnBoardingView: View {
  // MARK: - PROPERTIES
  
  var fruits: [Fruit] = fruitsData
  
  // MARK: - BODY
  
  var body: some View {
    TabView {
      ForEach(fruits[0...2]) { item in
        FruitCardView(fruit: item)
      } //: LOOP
    } //: TAB
    .tabViewStyle(PageTabViewStyle())
    .padding(.vertical, 20)
  }
}

struct OnBoardingView_Previews: PreviewProvider {
  static var previews: some View {
    OnBoardingView()
  }
}
