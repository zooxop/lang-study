//
//  ContentView.swift
//  PopToRootViewExample
//
//  Created by 문철현 on 2023/05/12.
//

import SwiftUI

struct ContentView: View {
    @State var isActive : Bool = false

    var body: some View {
        NavigationView {
            NavigationLink(
                destination: ContentView2(rootIsActive: self.$isActive),
                isActive: self.$isActive
            ) {
                Text("Hello, World!")
            }
            .isDetailLink(false)
            .navigationBarTitle("Root")
        }
    }
}

struct ContentView2: View {
    @Binding var rootIsActive : Bool

    var body: some View {
        NavigationLink(destination: ContentView3(shouldPopToRootView: self.$rootIsActive)) {
            Text("Hello, World #2!")
        }
        .isDetailLink(false)
        .navigationBarTitle("Two")
    }
}

struct ContentView3: View {
    @Binding var shouldPopToRootView : Bool

    var body: some View {
        VStack {
            Text("Hello, World #3!")
            Button (action: { self.shouldPopToRootView = false } ){
                Text("Pop to root")
            }
        }.navigationBarTitle("Three")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
