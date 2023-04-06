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
                Image("left")
//                    .resizable()
//                    .scaledToFit()

                Image("right")
//                    .resizable()
//                    .scaledToFit()
            }
//            Text("\(UIScreen.main.bounds.width)")
            HStack(spacing: -0.00001) {
                Image("PixelTest1")
//                    .resizable()
//                    .scaledToFill()

                Image("PixelTest2")
//                    .resizable()
//                    .scaledToFill()
            }
            .frame(width: UIScreen.main.bounds.width)
        }
    }
}

struct ImagePixelView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePixelView()
    }
}



