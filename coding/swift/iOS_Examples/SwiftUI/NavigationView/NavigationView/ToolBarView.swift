//
//  ToolBarView.swift
//  NavigationView
//
//  Created by 문철현 on 2023/05/26.
//

import SwiftUI

struct ToolBarView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Text("My app")
                Color.gray.ignoresSafeArea()
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigation) {
                    Image(systemName: "person")
                    Spacer()
                        .frame(width: .infinity)
                    HStack {
                        Image(systemName: "ellipsis")
                        Divider()
                        Image(systemName: "trash")
                            .frame(width: 32, height: 32)
                            .background(Color.blue)
                            .mask(Circle())
                    }
                }
            }
        }
    }
}

struct ToolBarView_Previews: PreviewProvider {
    static var previews: some View {
        ToolBarView()
    }
}
