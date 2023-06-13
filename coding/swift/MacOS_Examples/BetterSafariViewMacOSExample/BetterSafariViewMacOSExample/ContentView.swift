//
//  ContentView.swift
//  BetterSafariViewMacOSExample
//
//  Created by 문철현 on 2023/06/13.
//

import SwiftUI
import BetterSafariView
import AuthenticationServices
import SwiftUIWKWebView

struct ContentView: View {
    @State private var startingWebAuthenticationSession = false
    @State private var test: Bool = false
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
                    url: URL(string: "https://github.com/login/oauth/authorize")!,
                    callbackURLScheme: "github"
                ) { callbackURL, error in
                    print(callbackURL?.description ?? "aa", error?.localizedDescription ?? "bb")
                }
                .prefersEphemeralWebBrowserSession(true)
            }
            
            Button("WKView") {
                test.toggle()
            }
            .sheet(isPresented: $test) {
//                SwiftUIWKWebView(viewModel: .init(urlString: "https://apple.com")!)
                SwiftUIWKWebView(url: URL(string: "https://apple.com")!)
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
