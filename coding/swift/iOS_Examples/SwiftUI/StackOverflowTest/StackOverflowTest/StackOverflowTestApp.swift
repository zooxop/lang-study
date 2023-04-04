//
//  StackOverflowTestApp.swift
//  StackOverflowTest
//
//  Created by 문철현 on 2023/03/13.
//

import SwiftUI

class Benef: ObservableObject {
    @Published var val: String = ""
}

@main
struct StackOverflowTestApp: App {
    //@StateObject var beenf = Benef()
    @State var benef = ""
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
//            CardSlideView()
//            SheetView(testt: $benef)
            StateObjectTestView()
        }
    }
}
