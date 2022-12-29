//
//  ContentView.swift
//  Buttons
//
//  Created by 문철현 on 2022/12/29.
//

import SwiftUI

// Button
// State (Property wrapper)
// 하나의 뷰 안에서 사용되는 값

struct ContentView: View {
    
    // @State = 변수를 mutable한 지역변수화 시켜준다.
    // @State로 설정해놓은 변수는 UI가 변경될 때, 자동으로 View를 갱신시켜준다.
    @State private var didSelected = false
    
    var buttonImage: String {
        if didSelected {
            return "circle"
        } else {
            return "pencil"
        }
    }
    
    var body: some View {
        VStack {
            Text("current Status : \(didSelected.description)")
            
            Button {
                didSelected.toggle()
            } label: {
                HStack {
                    Image(systemName: buttonImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    VStack {
                        Text("Button \(didSelected.description)")
                        Text("Button \(didSelected.description)")
                    }
                }
            }
            .frame(width: 200, height: 100)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
