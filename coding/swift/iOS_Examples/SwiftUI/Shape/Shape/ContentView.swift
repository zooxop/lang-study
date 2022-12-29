//
//  ContentView.swift
//  Shape
//
//  Created by 문철현 on 2022/12/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Rectangle()
                .stroke(Color.orange, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .bevel, dash: [10, 20], dashPhase: 10))
                .overlay(
                    Text("Rectangle")
                )
                //.frame(width: 100, height: 100)
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.blue)
                .overlay(
                    Text("RoundRectangle")
                )
                //.frame(width: 100, height: 100)
            
            Circle()
                .fill(Color.blue)
                .overlay(
                    Text("Circle")
                )
                //.frame(width: 100, height: 100)
            
            Capsule()  // 늘어나는 원
                .fill(Color.blue)
                .overlay(
                    Text("Capsule")
                )
                //.frame(width: 200, height: 100)
            
            Ellipse()  // Capsule과는 다른 타입으로 늘어남
                .fill(Color.red)
                .overlay(
                    Text("Ellipse")
                )
                //.frame(width: 200, height: 100)
        }
        .frame(width: 200)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
