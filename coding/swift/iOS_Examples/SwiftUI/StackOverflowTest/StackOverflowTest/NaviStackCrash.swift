//
//  NaviStackCrash.swift
//  StackOverflowTest
//
//  Created by 문철현 on 2023/04/10.
//

import SwiftUI

struct NaviStackCrash: View {
    @State var isSheetShowing = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("hello")
            }
            .toolbar {
                Button("add") {
                    isSheetShowing.toggle()
                }
            }
            .sheet(isPresented: $isSheetShowing) {
                EmptyView()
            }
        }
    }
}

struct NaviStackCrash_Previews: PreviewProvider {
    static var previews: some View {
        NaviStackCrash()
    }
}
