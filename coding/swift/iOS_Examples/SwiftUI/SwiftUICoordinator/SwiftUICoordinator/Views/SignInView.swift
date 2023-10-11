//
//  SignInView.swift
//  SwiftUICoordinator
//
//  Created by 문철현 on 2023/10/10.
//

import SwiftUI

struct SignInView: View {
  @StateObject var coordinator = Coordinator(isRoot: true)
  @StateObject var signInViewModel: SignInViewModel
  
  init(signInViewModel: SignInViewModel = .init()) {
    _signInViewModel = StateObject(wrappedValue: signInViewModel)
  }
  
  var body: some View {
    VStack {
      coordinator.navigationLinkSection()

      Button {
        var transaction = Transaction()
        transaction.disablesAnimations = true
        withTransaction(transaction) {
          coordinator.push(destination: .tabView)
        }
      } label: {
        Text("Sign In")
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.red.opacity(0.2))
    .ignoresSafeArea()
  }
}

struct SignInView_Previews: PreviewProvider {
  static var previews: some View {
    let viewModel: SignInViewModel = .init()
    
    return SignInView(signInViewModel: viewModel)
  }
}
