//
//  ContentView.swift
//  NavigationView
//
//  Created by 문철현 on 2023/01/02.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        
        let myAppearance = UINavigationBarAppearance()
        
        myAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.blue,
            .font: UIFont.italicSystemFont(ofSize: 30)
        ]
        myAppearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white,
        ]
        
        myAppearance.backgroundColor = .orange
        
        UINavigationBar.appearance().standardAppearance = myAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = myAppearance
        UINavigationBar.appearance().compactAppearance = myAppearance
        
        // detail 페이지로 들어갔을 때의 navi 타이틀 색깔
        UINavigationBar.appearance().tintColor = .yellow
    }
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: Text("Destination"), label: {
                    HStack {
                        Image(systemName: "person")
                        Text("Navigate")
                    }
                })
            }
            .navigationBarTitle("Hello", displayMode: .large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
