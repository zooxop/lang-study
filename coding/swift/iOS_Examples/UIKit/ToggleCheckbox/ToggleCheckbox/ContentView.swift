//
//  ContentView.swift
//  ToggleCheckbox
//
//  Created by 문철현 on 2023/01/30.
//

import SwiftUI

struct ContentView: View {
    @State var isOn1 = false
    @State var isOn2 = false
    
    var body: some View {
        VStack {
            Toggle("Checkbox 1", isOn: $isOn1)
              .toggleStyle(CheckboxToggleStyle(style: .square))
              .foregroundColor(.blue)
            
            Checkbox(title: "Checkbox 2", color: .blue, isOn: $isOn2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
