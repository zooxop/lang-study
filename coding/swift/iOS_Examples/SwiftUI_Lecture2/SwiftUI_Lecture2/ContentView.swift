//
//  ContentView.swift
//  SwiftUI_Lecture2
//
//  Created by 문철현 on 2022/12/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, World! Hello, World!")
                .font(.largeTitle)
                .underline()
                .bold()
                // .background(Color.green)
                .foregroundColor(.blue)
                .cornerRadius(10)
                .truncationMode(.tail)
                //.frame(width: 100)
                .lineSpacing(10.0)
                .background(Color.green)
            Text("Hello, World!")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
