//
//  ContentView.swift
//  IntrospectScrollViewBugExample
//
//  Created by 문철현 on 9/26/24.
//

import SwiftUI
import SwiftUIIntrospect

struct ScrollClipDisabledView: View {
    var body: some View {
        HStack {
            VStack {
                Text("clipsToBounds = true")
                
                scrollView
                    
            }
            .padding(.leading, 10)
            
            VStack {
                Text("clipsToBounds = false")
                
                scrollView
                    .introspect(.scrollView, on: .iOS(.v16, .v17)) { scrollView in
                        scrollView.clipsToBounds = false
                    }
                    //.scrollClipDisabled()  // only iOS 17 later
            }
            .padding(.trailing, 10)
        }
    }
}

extension ScrollClipDisabledView {
    @ViewBuilder
    private var scrollView: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(0..<3) { _ in
                    HStack {
                        Spacer()
                        
                        Rectangle()
                            .fill(.green)
                            .frame(width: 150, height: 150)
                            .cornerRadius(10)
                        
                        Spacer()
                    }
                }
            }
        }
        .border(.black)
        .frame(height: 250)
    }
}

#if DEBUG
#Preview {
    ScrollClipDisabledView()
}
#endif
