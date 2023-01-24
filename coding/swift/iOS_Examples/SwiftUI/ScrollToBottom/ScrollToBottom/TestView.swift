//
//  TestView.swift
//  ScrollToBottom
//
//  Created by 문철현 on 2023/01/25.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        ScrollView {
            ScrollViewReader { proxy in
                LazyVStack {
                    ForEach(0..<50000, id: \.self) { i in
                        Button("Jump to \(i+500)") {
                            withAnimation {
                                proxy.scrollTo(i+500, anchor: .top)
                            }
                        }
                        Text("Example \(i)")
                            .id(i)
                    }
                }
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
