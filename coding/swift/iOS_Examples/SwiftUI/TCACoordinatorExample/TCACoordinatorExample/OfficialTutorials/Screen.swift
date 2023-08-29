//
//  Screen.swift
//  TCACoordinatorExample
//
//  Created by 문철현 on 2023/08/28.
//

import ComposableArchitecture
import Foundation
import SwiftUI

struct Screen: Reducer {
    enum State: Equatable, Identifiable {
        case home(Home.State)
        case numbersList(NumbersList.State)
        
        var id: UUID {
            switch self {
            case .home(let state):
                return state.id
            case .numbersList(let state):
                return state.id
            }
        }
    }
    
    enum Action {
        case home(Home.Action)
        case numbersList(NumbersList.Action)
    }
    
    var body: some ReducerOf<Self> {
        Scope(state: /State.home, action: /Action.home) {
            Home()
        }
        Scope(state: /State.numbersList, action: /Action.numbersList) {
            NumbersList()
        }
    }
}


// MARK: - Home

// View
struct HomeView: View {
    let store: StoreOf<Home>
    
    var body: some View {
        VStack {
            Button("Start") {
                store.send(.startTapped)
            }
        }
        .navigationTitle("Home")
    }
}

// Reducer
struct Home: Reducer {
    struct State: Equatable {
        let id = UUID()
    }
    
    enum Action {
        case startTapped
    }
    
    var body: some ReducerOf<Self> {
        EmptyReducer()
    }
}

// MARK: - NumbersList

// View
struct NumbersListView: View {
    let store: StoreOf<NumbersList>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            List(viewStore.state.numbers, id: \.self) { number in
                Button("\(number)") {
                    viewStore.send(.numberSelected(number))
                }
            }
        }
    }
}

// Reducer
struct NumbersList: Reducer {
    struct State: Equatable {
        let id = UUID()
        let numbers: [Int]
    }
    
    enum Action {
        case numberSelected(Int)
    }
    
    var body: some ReducerOf<Self> {
        EmptyReducer()
    }
}
