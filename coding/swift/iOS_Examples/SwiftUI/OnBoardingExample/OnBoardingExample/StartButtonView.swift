//
//  StartButtonView.swift
//  OnBoardingExample
//
//  Created by 문철현 on 2023/09/25.
//

import SwiftUI

struct StartButtonView: View {
  // MARK: - PROPERTIES
  
  @AppStorage("isOnboarding") var isOnboarding: Bool?
  
  // MARK: - BODY
  
  var body: some View {
    Button(action: {
      isOnboarding = false
    }) {
      HStack(spacing: 8) {
        Text("Start")
        
        Image(systemName: "arrow.right.circle")
          .imageScale(.large)
      }
      .padding(.horizontal, 16)
      .padding(.vertical, 10)
      .background(
        Capsule().strokeBorder(Color.white, lineWidth: 1.25)
      )
    } //: BUTTON
    .accentColor(Color.white)
  }
}

struct StartButtonView_Previews: PreviewProvider {
  static var previews: some View {
    StartButtonView()
      .preferredColorScheme(.dark)
      .previewLayout(.sizeThatFits)
  }
}
