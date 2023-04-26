//
//  ContentView.swift
//  NavigationTest
//
//  Created by 문철현 on 2023/02/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: MyView()){
                Text("Go to MyView")
            }
        }
    }
}

struct MyView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var backButton : some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            HStack {
                Image(systemName: "chevron.left") // BackButton Image
                    .aspectRatio(contentMode: .fit)
                Text("뒤뒤뒤")
            }
        }
    }
    
    var body: some View {
        VStack {
            Text("MyView")
                
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Dismiss")
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
