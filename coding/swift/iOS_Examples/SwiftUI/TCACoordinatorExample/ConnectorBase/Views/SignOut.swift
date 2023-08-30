//
//  SignOut.swift
//  ConnectorBase
//
//  Created by 문철현 on 2023/08/29.
//

import ComposableArchitecture
import SwiftUI

struct SignOutView: View {
  let store: StoreOf<SignOutFeature>
  
  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      VStack {
        Text("Sign Out View")
          .padding()
        
        Button("Sign out") {
          viewStore.send(.goToSignInTapped)
        }
      }
    }
  }
}

struct SignOutFeature: Reducer {
  struct State: Equatable {
    static let initialState = State()
  }
  
  enum Action: Equatable {
    case goToSignInTapped
  }
  
  var body: some ReducerOf<Self> {
    EmptyReducer()
  }
}
