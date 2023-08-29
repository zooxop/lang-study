//
//  MainTabCoordinator.swift
//  TCACoordinatorExample
//
//  Created by 문철현 on 2023/08/28.
//

import SwiftUI
import ComposableArchitecture
import TCACoordinators


// MARK: View
struct MainTabCoordinatorView: View {
    let store: StoreOf<MainTabCoordinator>
    
    var body: some View {
        WithViewStore(store, observe: \.selectedTab) { viewStore in
            TabView(selection: viewStore.binding(get: { $0 }, send: MainTabCoordinator.Action.tabSelected)) {
                IdentifiedCoordinatorView(
                    store: store.scope(
                        state: { $0.identified },
                        action: { .identified($0) }
                    )
                )
                .tabItem{ Text("Identified") }
                .tag(MainTabCoordinator.Tab.identified)
                
                IdentifiedCoordinatorView(
                    store: store.scope(
                        state: { $0.identified },
                        action: { .identified($0) }
                    )
                )
                .tabItem{ Text("IDID") }
                .tag(MainTabCoordinator.Tab.addTab)
            }
        }
    }
}

// MARK: Reducer
struct MainTabCoordinator: Reducer {
    enum Tab: Hashable {
        case identified
        case addTab
    }
    
    struct State: Equatable {
        static let initialState = State(
            identified: .initialState,
            selectedTab: .identified
        )
        
        var identified: IdentifiedCoordinator.State
        var selectedTab: Tab
    }
    
    enum Action {
        case identified(IdentifiedCoordinator.Action)
        
        case tabSelected(Tab)
    }
    
    var body: some ReducerOf<Self> {
        Scope(state: \.identified, action: /Action.identified) {
            IdentifiedCoordinator()
        }

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
