//
//  BView.swift
//  ToolBarPractice
//
//  Created by 문철현 on 2023/03/17.
//

import SwiftUI

struct BView: View {
    @StateObject var coordinator = Coordinator()
    @State var test: Bool = false
    @State var text: String = ""
    
    let product: Product
    var body: some View {
        VStack {
            coordinator.navigationLinkSection()
            Text("BView \(product.name)")
            
            Button {
                test.toggle()
            } label: {
                Text("Show Modal")
            }
            .sheet(isPresented: $test) {
                Text("Hello")
                TextField("omg...", text: $text)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    coordinator.push(destination: .aView)
                } label: {
                    Image(systemName: "a.square.fill")
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    coordinator.push(destination: .bView(.init(name: "")))
                } label: {
                    Image(systemName: "b.square.fill")
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    coordinator.push(destination: .cView)
                } label: {
                    Image(systemName: "c.square.fill")
                }
            }
        }
    }
}
