//
//  FeatureCore.swift
//  TCATemplateExample
//
//  Created by 문철현 on 2023/08/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import ComposableArchitecture

struct Feature: ReducerProtocol {
  struct State: Equatable {
    static let initialState: State = .init()
  }

  enum Action: Equatable {
    case onAppear
  }

  var body: some ReducerProtocolOf<Feature> {
    Reduce { state, action in
      switch action {
      case .onAppear:
        return .none
      }
    }
  }
}
