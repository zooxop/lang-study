//
//  NaviInTabView.swift
//  NavigationView
//
//  Created by 문철현 on 11/9/23.
//

import SwiftUI

struct TabInNavigationView: View {
  @State private var selection = 0
  
  var body: some View {
    NavigationView {
      TabView(selection: $selection) {
        VStack {
          Text("1번 View")
            .padding()
        }
        .tabItem {
          Image(systemName: "house")
        }
        .tag(0)
        
        VStack {
          Text("2번 View")
            .padding()
          
          NavigationLink("GOGO") {
            VStack {
              Text("Destination View")
                .padding()
            }
          }
        }
        .tabItem {
          Image(systemName: "house")
        }
        .tag(1)
      }
      .toolbar {
        if selection == 0 {
          ToolbarItem(placement: .topBarLeading) {
            Image(systemName: "square.and.arrow.up")
          }
        } else if selection == 1 {
          ToolbarItem(placement: .topBarTrailing) {
            Image(systemName: "trash")
          }
        }
      }
    }
  }
}

#Preview {
  TabInNavigationView()
}
