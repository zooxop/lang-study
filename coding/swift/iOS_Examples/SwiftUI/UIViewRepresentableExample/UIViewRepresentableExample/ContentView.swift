//
//  ContentView.swift
//  UIViewRepresentableExample
//
//  Created by 문철현 on 2023/05/02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        UIList(rows: generateRows())
    }
    
    func generateRows() -> [String] {
        (0..<100).reduce([]) { $0 + ["Row \($1)"] }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
