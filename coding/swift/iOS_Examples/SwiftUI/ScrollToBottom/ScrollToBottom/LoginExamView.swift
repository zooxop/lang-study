//
//  LoginExamView.swift
//  ScrollToBottom
//
//  Created by 문철현 on 2023/01/16.
//

import SwiftUI

struct LoginExamView: View {
    @Namespace var logInButtonId
    @Namespace var topId
    
    @StateObject var keyboardScroller = KeyboardScroll()
    
    @State var email = ""
    @State var password = ""
    
    let columns = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns) {
                    Image(systemName: "square.and.arrow.up")
                        .resizable()
                        .scaledToFill()
                        .padding(.horizontal, 70)
                        .padding(.vertical, 30)
                        .id(topId)
                    
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
                            .padding(.horizontal, 20)
                        
                            
                        SecureField("password", text: $password)
                            .textFieldStyle(.roundedBorder)
                            .textContentType(.password)
                            .autocorrectionDisabled()
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
                    }
                    .id(logInButtonId)
                }
            }
            .onChange(of: keyboardScroller.isKeyboardShow) { newValue in
                if newValue == true {
                    withAnimation {
                        if #available(iOS 16.0, *) {
                            proxy.scrollTo(logInButtonId, anchor: .top)
                        } else {
                            proxy.scrollTo(logInButtonId)
                        }
                    }
                } else {
                    withAnimation {
                        if #available(iOS 16.0, *) {
                            proxy.scrollTo(topId, anchor: .top)
                        } else {
                            proxy.scrollTo(topId)
                        }
                    }
                }
            }
        }
        .onAppear {
            keyboardScroller.addObservers()
        }
        .onDisappear {
            keyboardScroller.removeObservers()
        }
    }
}

struct LoginExamView_Previews: PreviewProvider {
    static var previews: some View {
        LoginExamView()
    }
}

class KeyboardScroll: ObservableObject {
    
    @Published public var isKeyboardShow = false
    
    func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardUp), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDown), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func removeObservers() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardUp(notification:NSNotification) {
        isKeyboardShow = true
    }
    
    @objc func keyboardDown(notification: NSNotification) {
        isKeyboardShow = false
    }
}
