//
//  ContentView.swift
//  SOFNavigationToolBar
//
//  Created by 문철현 on 2023/05/16.
//

import SwiftUI

struct GPNavigationPreview: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: GPNavigationPreview2()) {
                Text("GPNavigationPreview")
            }
            .gpToolbarItem(leftItems: [.logo()], rightItems: [.magnifyingGlass()])  // <-- 👀 2. to here
        }
        .gpNavigationTitle(.init("GPNavigationPreview"))
        // .gpToolbarItem(leftItems: [.logo()], rightItems: [.magnifyingGlass()])  // <-- 👀 1. move
    }
}

struct SwiftUIView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: GPNavigationPreview2()) {
                Text("GPNavigationPreview")
            }
            .gpToolbarItem(leftItems: [.logo()], rightItems: [.magnifyingGlass()])
        }
        .gpNavigationTitle(.init("GPNavigationPreview"))
    }
}

struct GPNavigationPreview2: View {
    var body: some View {
        NavigationLink(destination: GPNavigationPreview3()) {
            Text("GPNavigationPreview2")
        }
        .gpToolbarItem(leftItems: [.chevronLeft()], rightItems: [.heart()])
    }
}

struct GPNavigationPreview3: View {
    var body: some View {
        Text("GPNavigationPreview3")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GPNavigationPreview()
    }
}
