//
//  LoginExamView.swift
//  ScrollToBottom
//
//  Created by 문철현 on 2023/01/16.
//

import SwiftUI

struct LoginExamView: View, KeyboardReadable {
    @Namespace var logInButtonId
    @Namespace var logoId
    
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
                        .id(logoId)
                    
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
                            .onReceive(keyboardPublisher) { noti in
                                if noti == true {
                                    withAnimation {
                                        proxy.scrollTo(logInButtonId)
                                    }
                                } else {
//                                    withAnimation {
//                                        proxy.scrollTo(logoId)
//                                    }
                                }
                            }
                        .padding(.horizontal, 20)
                        
                            
                        SecureField("password", text: $password)
                            .textFieldStyle(.roundedBorder)
                            .textContentType(.password)
                            .autocorrectionDisabled()
                            .onReceive(keyboardPublisher) { noti in
                                if noti == true {
                                    withAnimation {
                                        proxy.scrollTo(logInButtonId)
                                    }
                                } else {
                                    withAnimation {
                                        proxy.scrollTo(logoId)
                                    }
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
                    .onTapGesture {
                        self.endTextEditing()
                    }
                }
            }
            .background(Color(UIColor.gray))
            .onAppear {  // 화면 전체 스크롤 안되도록. (바운스가 안되도록.)
                UIScrollView.appearance().bounces = false
            }
            .onDisappear {
                UIScrollView.appearance().bounces = true
            }
        }
    }
}

struct LoginExamView_Previews: PreviewProvider {
    static var previews: some View {
        LoginExamView()
    }
}

extension View {
    
    func endTextEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
