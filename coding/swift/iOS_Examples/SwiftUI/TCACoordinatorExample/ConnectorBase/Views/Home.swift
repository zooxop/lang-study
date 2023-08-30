//
//  Home.swift
//  ConnectorBase
//
//  Created by 문철현 on 2023/08/29.
//

import ComposableArchitecture
import SwiftUI

struct HomeView: View {
  let store: StoreOf<HomeFeature>
  
  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      VStack {
        Text("Home View")
          .padding()
      }
    }
  }
}

struct HomeFeature: Reducer {
  struct State: Equatable {
    static let initialState = State()
  }
  
  enum Action {
    case nextButtonTapped
  }
  
  var body: some ReducerOf<Self> {
    EmptyReducer()
  }
}
