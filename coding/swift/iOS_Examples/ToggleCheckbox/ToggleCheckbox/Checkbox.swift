//
//  ToggleCheckbox.swift
//  ToggleCheckbox
//
//  Created by 문철현 on 2023/01/30.
//

import SwiftUI

// Image + Text 조합으로 구현한 Checkbox component
struct Checkbox: View {
    public var title: LocalizedStringKey
    public var color: Color
    @Binding public var isOn: Bool
    
    private var checkboxImage: String {
        if self.isOn {
            return "checkmark.square.fill"
        } else {
            return "square"
        }
    }
    private var checkboxColor: Color {
        if self.isOn {
            return self.color
        } else {
            return Color.secondary
        }
    }
    
    var body: some View {
        HStack {
            Image(systemName: self.checkboxImage)
                .foregroundColor(self.checkboxColor)
                .onTapGesture {
                    self.isOn.toggle()
                }
            
            Text(title)
        }
    }
}
