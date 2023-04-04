//
//  ImagePixelView.swift
//  StackOverflowTest
//
//  Created by 문철현 on 2023/04/05.
//

import SwiftUI

struct ImagePixelView: View {
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                Image("PixelTest1")
                    .resizable()
                    .scaledToFit()

                Image("PixelTest2")
                    .resizable()
                    .scaledToFit()
            }
        }
    }
}

struct ImagePixelView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePixelView()
    }
}
