//
//  ProgressViewAnimationGlitch.swift
//  StackOverflowTest
//
//  Created by 문철현 on 2023/05/04.
//

import SwiftUI

struct ProgressViewAnimationGlitch: View {
    @State private var isShowingProgressView: Bool = false
    var body: some View {
        ZStack(alignment: .center) {
            if !isShowingProgressView {
                Circle()
                    .fill(Color.red)
                    .onTapGesture {
                        withAnimation {
                            isShowingProgressView = true
                        }
                    }
                    .transition(.scale)
            }
            
            if isShowingProgressView {
                ProgressView()
                    .transition(.scale)
            }
        }
        .frame(width: 100, height: 100, alignment: .center)
    }
}

struct ProgressViewAnimationGlitch_Previews: PreviewProvider {
    static var previews: some View {
        ProgressViewAnimationGlitch()
    }
}
