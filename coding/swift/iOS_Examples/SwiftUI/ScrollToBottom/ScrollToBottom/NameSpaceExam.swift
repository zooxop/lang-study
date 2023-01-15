//
//  NameSpaceExam.swift
//  ScrollToBottom
//
//  Created by 문철현 on 2023/01/14.
//

import SwiftUI

struct NameSpaceExam: View {
    @Namespace var buttonOneId
    @Namespace var buttonTwoId
    
    var body: some View {
        VStack {
            Spacer()
            
            Button {
                // action
            } label: {
                Text("Button One")
            }
            .id(buttonOneId)
            
            Spacer()
            
            Button {
                // action
            } label: {
                Text("Button Two")
            }
            .id(buttonTwoId)
            
            Spacer()
        }
    }
}


struct NameSpaceExam_Previews: PreviewProvider {
    static var previews: some View {
        NameSpaceExam()
    }
}
