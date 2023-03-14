//
//  ToggleView.swift
//  StackOverflowTest
//
//  Created by 문철현 on 2023/03/15.
//

import SwiftUI

struct ToggleTest: View {
    @State private var toggleisOn = true
    
    var body: some View {
        VStack {
            Toggle("Status", isOn: $toggleisOn)
                .toggleStyle(.switch)
        }
    }
}

struct Toggle_Previews: PreviewProvider {
    static var previews: some View {
        ToggleTest()
    }
}
