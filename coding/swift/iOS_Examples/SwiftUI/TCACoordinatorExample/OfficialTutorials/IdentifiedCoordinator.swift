//
//  IdentifiedCoordinator.swift
//  TCACoordinatorExample
//
//  Created by 문철현 on 2023/08/28.
//

import ComposableArchitecture
import SwiftUI
import TCACoordinators

// MARK: View
struct IdentifiedCoordinatorView: View {
    let store: StoreOf<IdentifiedCoordinator>
    
    var body: some View {
        TCARouter(store) { screen in
            SwitchStore(screen) { screen in
                switch screen {
                case .home:
                    CaseLet(
                        /Screen.State.home,
                         action: Screen.Action.home,
                         then: HomeView.init
                    )
                    
                case .numbersList:
                    CaseLet(
                        /Screen.State.numbersList,
                         action: Screen.Action.numbersList,
                         then: NumbersListView.init
                    )
                }
            }
        }
    }
}

// MARK: Reducer
struct IdentifiedCoordinator: Reducer {
    
    struct State: Equatable, IdentifiedRouterState {
        static let initialState = State(
            routes: [.root(.home(.init()), embedInNavigationView: true)]
        )
        
        var routes: IdentifiedArrayOf<Route<Screen.State>>
    }
    
    enum Action: IdentifiedRouterAction {
        case routeAction(Screen.State.ID, action: Screen.Action)
        case updateRoutes(IdentifiedArrayOf<Route<Screen.State>>)
    }
    
    var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .routeAction(_, action: .home(.startTapped)):
                state.routes.presentSheet(.numbersList(.init(numbers: Array(0 ..< 4))), embedInNavigationView: true)
                
            default:
                break
            }
            
            return .none
        }.forEachRoute {
            Screen()
        }
    }
}
