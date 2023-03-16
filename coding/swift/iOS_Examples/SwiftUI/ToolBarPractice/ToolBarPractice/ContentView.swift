//
//  ContentView.swift
//  ToolBarPractice
//
//  Created by 문철현 on 2023/03/16.
//

import SwiftUI

struct ContentView: View {
    @State private var showNew = false
    let name = ["A", "B"]
    
    var body: some View {
        NavigationView {
            List(name, id: \.self) { name in
                NavigationLink(destination: Text("hi")) {
                    Text(name)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .background(
                NavigationLink(destination: Text("hello"), isActive: $showNew) {
                    EmptyView()
                }
            )
            .toolbar {
                SecondView(showNew: $showNew)
            }
        }
    }
}

struct SecondView: View {
    @Binding var showNew: Bool
    
    var body: some View {
        EmptyView()
        .toolbar {
            ToolbarItem(placement: .principal) {
                Button("New Element") {
                    self.showNew = true
                }
            }
        }
    }
}

struct CustomToolBar: View {
    var body: some View {
        ZStack {
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
