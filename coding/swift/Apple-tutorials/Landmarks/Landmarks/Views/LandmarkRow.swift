//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by 문철현 on 2/2/24.
//

import SwiftUI

struct LandmarkRow: View {
  var landmark: Landmark
  
  var body: some View {
    HStack {
      landmark.image
        .resizable()
        .frame(width: 50, height: 50)
      Text(landmark.name)
      
      Spacer()
    }
  }
}
// TODO: Section 4 부터 진행하기
#Preview("Turtle Rock & Salmon") {
  Group {
    LandmarkRow(landmark: landmarks[0])
    LandmarkRow(landmark: landmarks[1])
  }
}
