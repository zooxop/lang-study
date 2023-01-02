//
//  SwiftUIView.swift
//  SwiftUI_Lecture3
//
//  Created by 문철현 on 2022/12/29.
//

import SwiftUI

// SF Symbols
struct SwiftUIView: View {
    var body: some View {
        Image(systemName: "wifi")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 300, height: 300)
            .foregroundColor(.red)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
