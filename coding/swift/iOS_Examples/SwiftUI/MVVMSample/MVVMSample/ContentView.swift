//
//  ContentView.swift
//  MVVMSample
//
//  Created by 문철현 on 2023/01/05.
//

import SwiftUI

// Model
struct Person {
    var name: String
    var birthday: Date
}

struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            Text(viewModel.ham.name)
                .padding()
            Text(viewModel.age)
                .padding()
            
            Button("이름 변경") {
                viewModel.changeName("Jax")
            }
        }
    }
}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
