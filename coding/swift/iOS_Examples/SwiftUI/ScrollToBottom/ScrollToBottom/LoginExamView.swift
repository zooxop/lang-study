//
//  LoginExamView.swift
//  ScrollToBottom
//
//  Created by 문철현 on 2023/01/16.
//

import SwiftUI

struct LoginExamView: View, KeyboardReadable {
    @State var email = ""
    @State var password = ""
    
    @Namespace var logInButtonId
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.vertical, showsIndicators: false) {
                
                Image("notebook")
                    .resizable()
                    .scaledToFill()
                    .padding(.horizontal, 70)
                    .padding(.vertical, 50)
                
                HStack {
                    Image(systemName: "iphone.and.arrow.forward")
                        .resizable()
                        .frame(height: 30)
                        .scaledToFit()
                        .padding(.leading, 20)
                    
                    Text("로그인")
                        .font(.largeTitle)
                        .bold()
                        
                    Spacer()
                }
                
                //MARK: - User Input (Email / PW / Remember me)
                VStack(spacing: 10) {
                    //MARK: Email
                    HStack {
                        Image(systemName: "envelope")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .scaledToFit()
                            .foregroundColor(.accentColor)
                        
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
                    }
                    .padding(.horizontal, 20)
                    
                    //MARK: PW
                    HStack {
                        Image(systemName: "lock")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .scaledToFit()
                            .foregroundColor(.accentColor)
                        
                        SecureField("password", text: $password)
                            .textFieldStyle(.roundedBorder)
                            .textContentType(.password)
                            .autocorrectionDisabled()
                            .onReceive(keyboardPublisher) { _ in
                                withAnimation {
                                    proxy.scrollTo(logInButtonId)
                                }
                            }
                    }
                    .padding(.horizontal, 20)
                    
                    VStack {
                        Button {
                            // 유효성 검사
                        
                        } label: {
                            Text("Sign in")
                                .foregroundColor(.black)
                                .bold()
                        }
                        .frame(maxWidth: 300)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.green))
                        .buttonStyle(.plain)
                        .id(logInButtonId)  // Button ID (for scroll)
                        
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

