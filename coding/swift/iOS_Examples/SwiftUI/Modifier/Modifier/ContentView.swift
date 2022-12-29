//
//  ContentView.swift
//  Modifier
//
//  Created by 문철현 on 2022/12/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Main Title!")
                .font(.largeTitle)
                .foregroundColor(.black)
                .bold()
            
            Text("Sub Title!")
                .modifier(MyTextStyle(myColor: .orange))
                .italic()
            
            Text("Description!")
                .modifier(MyTextStyle())
                .padding(.bottom, 20)
            
            Text("Description!")
                .modifier(MyTextStyle(myWeight: .bold))
            
            Text("Description!")
                .customFont()
        }
    }
}

struct MyTextStyle: ViewModifier {
    var myWeight = Font.Weight.regular
    var myFont = Font.title2
    var myColor = Color.black
    
    func body(content: Content) -> some View {
        content
            .font(myFont.weight(myWeight))
            .foregroundColor(myColor)
            //.italic()
            .padding(.bottom, 20)
    }
}

extension Text {
    func customFont() -> Text {
        self.font(.title2)
            .bold()
            .italic()
            .foregroundColor(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
