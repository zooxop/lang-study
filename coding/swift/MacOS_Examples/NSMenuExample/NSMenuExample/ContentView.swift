//
//  ContentView.swift
//  NSMeneExample
//
//  Created by 문철현 on 2023/04/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack(alignment: .trailing) {
                HStack(alignment: .top) {
                    Menu {
                        Button("Quit") {
                            NSApplication.shared.terminate(nil)
                        }.keyboardShortcut("q")
                    } label: {
                        //Image(systemName: "house").imageScale(.large)
                        Text(Image(systemName: "house"))
                    }
                    .menuStyle(BorderlessButtonMenuStyle())
                    .fixedSize()
                    .background(Color.white)
                    .hideChevron()
                }
            }
        }.padding()
    }
}

extension View {
    @ViewBuilder
    func hideChevron() -> some View {
        if #available(macOS 12.0, *) {
            self.menuIndicator(.hidden)
        } else {
            self
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .frame(width: 400, height: 400)
    }
}
