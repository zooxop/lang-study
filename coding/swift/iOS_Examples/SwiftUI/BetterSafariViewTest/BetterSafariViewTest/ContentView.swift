//
//  ContentView.swift
//  BetterSafariViewTest
//
//  Created by 문철현 on 2023/06/13.
//

import SwiftUI
import BetterSafariView

struct ContentView: View {
    @State private var startingWebAuthenticationSession = false
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Button("Start WebAuthenticationSession") {
                self.startingWebAuthenticationSession = true
            }
            .webAuthenticationSession(isPresented: $startingWebAuthenticationSession) {
                WebAuthenticationSession(
                    url: URL(string: "http://192.168.0.203:5001/login")!,
                    callbackURLScheme: "myapp"
                ) { callbackURL, error in
                    //print(callbackURL, error)
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
