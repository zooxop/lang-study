//
//  ContentView.swift
//  PopupViewTest
//
//  Created by 문철현 on 2023/06/11.
//

import SwiftUI
import PopupView

struct ContentView: View {
    @State var showingPopup: Bool = false
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
                
                Button {
                    showingPopup.toggle()
                } label: {
                    Text("Show Popup")
                }
                .padding(.vertical, 30)
            }
        }
        .frame(width: 300, height: 300)
        .padding()
        .popup(isPresented: $showingPopup) {
            Text("The popup")
                .frame(width: 200, height: 60)
                .background(Color(red: 0.85, green: 0.8, blue: 0.95))
                .cornerRadius(30.0)
        } customize: {
            $0.autohideIn(2)
                .position(.bottom)
                .isOpaque(false)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
