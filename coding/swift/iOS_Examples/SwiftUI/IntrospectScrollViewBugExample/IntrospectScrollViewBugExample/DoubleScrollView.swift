//
//  DoubleScrollView.swift
//  IntrospectScrollViewBugExample
//
//  Created by 문철현 on 9/27/24.
//

import SwiftUI
import SwiftUIIntrospect

struct DoubleScrollView: View {
    var body: some View {
        ScrollView {
            ForEach(0..<2) { _ in
                Rectangle()
                    .fill(.green)
                    .padding()
                    .frame(height: 100)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(0..<20) { _ in
                        Rectangle()
                            .fill(.red)
                            .padding()
                            .frame(width: 80, height: 80)
                    }
                }
            }
            .introspect(
                .scrollView,
                on: .iOS(.v14, .v15, .v16, .v17),
                scope: .receiver
            ) { scrollView in
                scrollView.clipsToBounds = false
            }
            .border(.black)
            .padding()
            //.scrollClipDisabled()
            
            ForEach(0..<2) { _ in
                Rectangle()
                    .fill(.green)
                    .padding()
                    .frame(height: 100)
            }
        }
        .border(.black)
        .padding()
        .frame(height: 300)
    }
}

#if DEBUG
#Preview {
    DoubleScrollView()
}
#endif
