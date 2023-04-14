//
//  LoginExamTestView.swift
//  ScrollToBottom
//
//  Created by 문철현 on 2023/04/14.
//

import SwiftUI

struct FixedImageView: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            Image(systemName: "apple.logo")
                .resizable()
                .scaledToFill()
                .padding(.horizontal, 70)
                .frame(width: 300, height: 300)
                .fixedSize()
            
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
            
            Spacer()
        }
        
    }
}

struct FixedImageView_Previews: PreviewProvider {
    static var previews: some View {
        FixedImageView()
    }
}
