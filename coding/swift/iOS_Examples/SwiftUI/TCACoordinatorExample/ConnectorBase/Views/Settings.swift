//
//  Settings.swift
//  ConnectorBase
//
//  Created by 문철현 on 2023/08/29.
//

import ComposableArchitecture
import SwiftUI

struct SettingsView: View {
  let store: StoreOf<SettingsFeatrue>
  
  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      VStack {
        Text("Settings View")
          .padding()
        
        Button("Go to Sign Out View") {
          viewStore.send(.signOutTapped)
        }
      }
    }
  }
}

struct SettingsFeatrue: Reducer {
  struct State: Equatable {
    static let initialState = State()
  }
  
  enum Action: Equatable {
    case signOutTapped
  }
  
  var body: some ReducerOf<Self> {
    EmptyReducer()
  }
}
