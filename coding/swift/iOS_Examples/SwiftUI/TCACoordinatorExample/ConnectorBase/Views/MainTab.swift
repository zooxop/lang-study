//
//  MainTab.swift
//  ConnectorBase
//
//  Created by 문철현 on 2023/08/29.
//

import SwiftUI
import ComposableArchitecture

struct MainTabView: View {
  let store: StoreOf<MainTabFeature>
  
  var body: some View {
    WithViewStore(self.store, observe: \.selectedTab) { viewStore in
      TabView(selection: viewStore.binding(get: { $0 }, send: MainTabFeature.Action.tabSelected)) {
        HomeView(
          store: store.scope(
            state: { $0.home },
            action: { .home($0) }
          )
        )
        .tabItem { Image(systemName: "house") }
        .tag(MainTabFeature.Tab.home)
        
        StatsView(
          store: store.scope(
            state: { $0.stats },
            action: { .stats($0) }
          )
        )
        .tabItem { Image(systemName: "chart.bar") }
        .tag(MainTabFeature.Tab.stats)
        
        SettingsView(
          store: store.scope(
            state: { $0.settings },
            action: { .settings($0) }
          )
        )
        .tabItem { Image(systemName: "gear") }
        .tag(MainTabFeature.Tab.settings)
      }
    }
  }
}

struct MainTabFeature: Reducer {
  enum Tab: Hashable {
    case home
    case stats
    case settings
  }
  
  struct State: Equatable {
    static let initialState = State(
      home: .initialState,
      stats: .initialState,
      settings: .initialState,
      selectedTab: .home
    )
    
    var home: HomeFeature.State
    var stats: StatsFeature.State
    var settings: SettingsFeatrue.State
    
    var selectedTab: Tab
  }
  
  enum Action: Equatable {
    case home(HomeFeature.Action)
    case stats(StatsFeature.Action)
    case settings(SettingsFeatrue.Action)
    
    case tabSelected(Tab)
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
        
      case .tabSelected(let tab):
        state.selectedTab = tab
        
      default:
        break
      }
      
      return .none
    }
  }
}
