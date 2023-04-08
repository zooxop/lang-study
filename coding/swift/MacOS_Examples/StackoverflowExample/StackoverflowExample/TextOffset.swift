//
//  TextOffset.swift
//  StackoverflowExample
//
//  Created by 문철현 on 2023/04/01.
//

import SwiftUI

struct TextOffset: View {
    var body: some View {
        Button("Show window") {
            let window = NSWindow()
            window.styleMask = [.titled, .closable]
            window.contentView = NSHostingView(rootView: WindowContent())
            window.makeKeyAndOrderFront(nil)
            
//            var frame :NSRect = window.frame
//            frame.origin.y -= frame.size.height; // remove the old height
//            frame.origin.y += 100; // add the new height
//            frame.size = CGSize.init(width: 300, height: 300);
//
//            window.setFrame(frame, display: true)
            
            window.center()
        }
        .padding()
    }
}

struct TextOffset_Previews: PreviewProvider {
    static var previews: some View {
        TextOffset()
    }
}

struct WindowContent: View {
    @State private var showRectangle = false
    
    var body: some View {
        VStack {
            Text("Hello, world")
            
            if showRectangle {
//                withAnimation(.linear(duration: 1)) {
                    Rectangle().fill(Color.red)
                        .frame(height: 100)
                        .frame(maxWidth: .infinity)
                        .animation(.linear(duration: 1), value: showRectangle)
                        .padding(10)
//                }
            } else {
                Spacer()
                    .frame(height: 100)
                    .padding(10)
            }
            
            
            Button(action: {
                withAnimation(.linear(duration: 1)) {
                    showRectangle.toggle()
                }
            }) {
                Text("Toggle")
            }
        }
        .fixedSize()
        .frame(width: 300, height: 300)
        .padding(20)
    }
}
