//
//  TemplateCore.swift
//  TCATemplateExample
//
//  Created by 문철현 on 2023/08/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import ComposableArchitecture

struct Template: Reducer {
  struct State: Equatable {
    static let initialState: State = .init()
  }

  enum Action: Equatable {
    case onAppear
  }

  func reduce(into state: inout State, action: Action) -> Effect<Action> {
    switch action {
    case .onAppear:
      return .none
    }
  }
}
