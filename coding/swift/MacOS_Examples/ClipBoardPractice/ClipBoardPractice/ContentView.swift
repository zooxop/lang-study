//
//  ContentView.swift
//  ClipBoardPractice
//
//  Created by 문철현 on 2023/04/08.
//

import SwiftUI

struct ContentView: View {
    @State private var image: NSImage?
    
    var body: some View {
        VStack {
            if let image = image {
                Image(nsImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                Text("No image")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            let pasteboard = NSPasteboard.general
            if let data = pasteboard.data(forType: .tiff),
               let image = NSImage(data: data) {
                self.image = image
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
