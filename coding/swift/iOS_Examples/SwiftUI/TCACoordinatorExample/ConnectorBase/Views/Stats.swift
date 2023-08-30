//
//  Stats.swift
//  ConnectorBase
//
//  Created by 문철현 on 2023/08/29.
//

import ComposableArchitecture
import SwiftUI

struct StatsView: View {
  let store: StoreOf<StatsFeature>
  
  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      VStack {
        Text("Stats View")
      }
    }
  }
}

struct StatsFeature: Reducer {
  struct State: Equatable {
    static let initialState = State()
  }
  
  enum Action: Equatable {
    case helloButtonTapped
  }
  
  var body: some ReducerOf<Self> {
    EmptyReducer()
  }
}
