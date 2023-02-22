//
//  ContentView.swift
//  AlertTest
//
//  Created by 문철현 on 2023/02/21.
//

import SwiftUI

struct ContentView: View {
    @State public var isShow1: Bool = false
    @State public var isShow2: Bool = false
    
    var body: some View {
        VStack(spacing: 30.0) {
            Button {
                self.isShow1.toggle()
            } label: {
                Text("Alert 1")
            }
            .alert(isPresented: $isShow1) {
                return Alert(title: Text("Alert1 show."))
            } // 상위 View에 존재하는 alert으로 인해, 동작하지 않음.
            
            Button {
                self.isShow2.toggle()
            } label: {
                Text("Alert 2")
            }
            // .alert(isPresented: $isShow2) {
            //     return Alert(title: Text("Alert2 show."))
            // }
        }
        .padding()
        .alert(isPresented: $isShow2) {
            return Alert(title: Text("Alert2 show."))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
