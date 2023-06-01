//
//  StatusMenu.swift
//  MenuBarClickExample
//
//  Created by 문철현 on 2023/06/01.
//

import SwiftUI

struct StatusMenu: View {
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .contextMenu {
//                Button("Remove") {
//                    print("remove this view")
//                }
//            }
        
        Button("Button") {
            // Perform action
        }
        .contextMenu {
            Button("Option 1") {
                // Perform action
            }
            Button("Option 2") {
                // Perform action
            }
            Button("Option 3") {
                // Perform action
            }
        }
    }
}

struct StatusMenu_Previews: PreviewProvider {
    static var previews: some View {
        StatusMenu()
    }
}
