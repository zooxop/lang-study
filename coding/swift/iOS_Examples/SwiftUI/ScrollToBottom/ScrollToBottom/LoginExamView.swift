//
//  LoginExamView.swift
//  ScrollToBottom
//
//  Created by 문철현 on 2023/01/16.
//

import SwiftUI

struct LoginExamView: View, KeyboardReadable {
    @Namespace var logInButtonId
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            ScrollViewReader { proxy in
                VStack {
                    Image(systemName: "apple.logo")
                        .resizable()
                        .scaledToFill()
                        .padding(.horizontal, 70)
                        .padding(.vertical, 30)
                    
                    HStack {
                        Text("Log in")
                            .font(.largeTitle)
                            .bold()
                            .padding(.leading, 15)
                            
                        Spacer()
                    }
                    
                    VStack(spacing: 10) {
                            
                        TextField("email", text: $email)
                            .textFieldStyle(.roundedBorder)
                            .textContentType(.emailAddress)
                            .autocapitalization(.none)
                            .autocorrectionDisabled()
                            .onReceive(keyboardPublisher) { _ in
                                withAnimation {
                                    proxy.scrollTo(logInButtonId)
                                }
                            }
                            .padding(.horizontal, 20)
                        
                            
                        SecureField("password", text: $password)
                            .textFieldStyle(.roundedBorder)
                            .textContentType(.password)
                            .autocorrectionDisabled()
                            .onReceive(keyboardPublisher) { _ in
                                withAnimation {
                                    proxy.scrollTo(logInButtonId)
                                }
                            }
                            .padding(.horizontal, 20)
                    }
                    .padding(.bottom, 20)
                    // MARK: Log in button
                    VStack {
                        Button {
                            // action
                        } label: {
                            Text("Sign in")
                                .foregroundColor(.black)
                                .bold()
                        }
                        .frame(maxWidth: 300)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.green))
                        .buttonStyle(.plain)
                        .id(logInButtonId)
                        
                        Spacer()
                    }
                }
            }
        }
    }
}

struct LoginExamView_Previews: PreviewProvider {
    static var previews: some View {
        LoginExamView()
    }
}
