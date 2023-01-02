//
//  ContentView.swift
//  Placeholder
//
//  Created by 문철현 on 2023/01/02.
//

import SwiftUI

struct ContentView: View {
    
    @State private var myString = "hello world"
    
    @State private var showPlaceholder = false
    
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay(Circle().stroke())
                Text(myString)
                    .foregroundColor(.red)
                    .padding()
            }
            .redacted(reason: showPlaceholder ? .placeholder : .init())
            
            
            Button("click me") {
                // myString = "hi"
                showPlaceholder.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
