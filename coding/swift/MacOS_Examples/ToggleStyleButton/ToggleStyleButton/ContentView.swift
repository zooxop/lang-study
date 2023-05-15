//
//  ContentView.swift
//  ToggleStyleButton
//
//  Created by 문철현 on 2023/05/15.
//

import SwiftUI

struct ContentView: View {
    @State var isOn: Bool = false
    
    var body: some View {
        VStack {
            Button {
                withAnimation(.easeInOut(duration: 0.2)) {
                    isOn.toggle()
                }
            } label: {
                Toggle("", isOn: $isOn)
                    .toggleStyle(CustomSwitchToggleStyle(size: .medium))
                    .padding(2)
            }
            .buttonStyle(.borderless)
            
            Button {
                isOn.toggle()
            } label: {
                Text("test")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .frame(width: 200, height: 200)
    }
}

struct CustomSwitchToggleStyle: ToggleStyle {
    var size: Size = .medium
    
    enum Size {
        case small
        case medium
        case large
    }
    
    private var frame: CGSize {
        switch size {
        case .small:
            return CGSize(width: 20, height: 20)
        case .medium:
            return CGSize(width: 25, height: 25)
        case .large:
            return CGSize(width: 30, height: 30)
        }
    }
   
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
                .fill(configuration.isOn ? Color.green.opacity(0.8) : Color.gray.opacity(0.4))
            Circle()
                .fill(Color.white)
                .shadow(radius: 1)
                .frame(width: frame.width, height: frame.height)
                .offset(x: configuration.isOn ? frame.width/2 : -frame.width/2)
        }
        .frame(width: frame.width*2, height: frame.height+2)
//        .onTapGesture {
//            withAnimation(.easeInOut(duration: 0.2)) {
//                configuration.isOn.toggle()
//            }
//        }
    }
}
