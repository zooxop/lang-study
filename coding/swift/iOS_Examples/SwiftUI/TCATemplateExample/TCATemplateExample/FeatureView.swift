//
//  FeatureView.swift
//  TCATemplateExample
//
//  Created by 문철현 on 2023/08/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct FeatureView: View {
  let store: StoreOf<Feature>

  var body: some View {
    WithViewStore(store) { viewStore in
      VStack(spacing: 10) {

      }
      .onAppear {
        viewStore.send(.onAppear)
      }
    }
  }
}

struct FeatureView_Previews: PreviewProvider {
  static var previews: some View {
    FeatureView(
      store: .init(
        initialState: .initialState,
        reducer: Feature()
      )
    )
  }
}
