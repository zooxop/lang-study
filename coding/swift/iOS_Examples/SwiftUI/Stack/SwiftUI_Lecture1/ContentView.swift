//
//  ContentView.swift
//  SwiftUI_Lecture1
//
//  Created by 문철현 on 2022/12/28.
//

import SwiftUI

// Stack (H, V, Z Stack)

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack {
                Color.init(red: 200/255, green: 200/255, blue: 200/255)
                    .edgesIgnoringSafeArea(.all)
                Text("BG Test")
            }
            
            
            VStack {
                HStack {
                    Text("World!")
                    Text("World!")
                    Text("World!")
                }
                Text("Hello!")
                    .font(.largeTitle)
                    .foregroundColor(.red)
                    .padding(.top, 50)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
