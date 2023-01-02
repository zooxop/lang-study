//
//  ContentView.swift
//  TabBar
//
//  Created by 문철현 on 2023/01/02.
//

import SwiftUI

// UIKit에서는 TabBar
// SwiftUI에서는 TabView

struct ContentView: View {
    var body: some View {
        TabView {
            First().tabItem {
                    Image(systemName: "person")
                    Text("person")
                }
            .edgesIgnoringSafeArea(.top)
            
            Second().tabItem {
                Image(systemName: "person.fill")
                Text("person.fill")
            }
        }
    }
}

struct First: View {
    var body: some View {
        ZStack {
            Color.orange
            Text("First")
        }
    }
}

struct Second: View {
    var body: some View {
        ZStack {
            Color.yellow
            Text("Second")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
