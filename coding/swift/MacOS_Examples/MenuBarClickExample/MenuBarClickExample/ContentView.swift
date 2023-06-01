//
//  ContentView.swift
//  MenuBarClickExample
//
//  Created by 문철현 on 2023/06/01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            
//            RightClickableSwiftUIView()
        }
        .contextMenu {
            Button("Remove") {
                print("remove this view")
            }
        }
        .padding()
    }
}

struct RightClickableSwiftUIView: NSViewRepresentable {
    func updateNSView(_ nsView: RightClickableView, context: NSViewRepresentableContext<RightClickableSwiftUIView>) {
        print("Update")
    }
    
    func makeNSView(context: Context) -> RightClickableView {
        RightClickableView()
    }
}

class RightClickableView: NSView {
    override func mouseDown(with theEvent: NSEvent) {
        print("left mouse")
    }
    
    override func rightMouseDown(with theEvent: NSEvent) {
        print("right mouse")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
