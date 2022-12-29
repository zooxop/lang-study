//
//  ContentView.swift
//  Toggle
//
//  Created by 문철현 on 2022/12/29.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isOn = false
    
    var body: some View {
        VStack {
            MyToggle(isOn: $isOn)
            Text("\(isOn.description)")
        }
    }
}

struct MyToggle: View {
    
    // @Binding 타입 변수는 원본이 아님. (일종의 레퍼런스 타입이라고 이해하면 될듯??)
    @Binding var isOn: Bool
    
    var body: some View {
        Toggle("toggle \(isOn.description)", isOn: $isOn)
        Toggle(isOn: $isOn, label: {
            HStack {
                Spacer()
                VStack {
                    Text("Label")
                    Text("Label")
                }
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
