//
//  ContentView.swift
//  SUVerification
//
//  Created by 문철현 on 2022/12/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        #if os(iOS)
        Group {
            ContentView().previewDevice("iPhone 14")
        }
        #else
        ContentView().previewDevice("Mac")
        #endif
    }
}
