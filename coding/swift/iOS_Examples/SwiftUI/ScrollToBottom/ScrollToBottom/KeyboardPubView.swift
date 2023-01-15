//
//  KeyboardPubView.swift
//  ScrollToBottom
//
//  Created by 문철현 on 2023/01/14.
//

import SwiftUI

struct KeyboardPubView: View {
    @State var email = ""
    
    @Namespace var loginButtonId
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                TextField("email", text: self.$email)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.emailAddress)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
//                    .onReceive(keyboardPublisher) { _ in
//                        withAnimation {
//                            proxy.scrollTo(loginButtonId)
//                        }
//                    }
            }
        }
    }
}

struct KeyboardPubView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardPubView()
    }
}
