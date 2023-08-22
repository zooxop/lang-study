//
//  TemplateView.swift
//  TCATemplateExample
//
//  Created by 문철현 on 2023/08/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct TemplateView: View {
  let store: StoreOf<Template>

  var body: some View {
      WithViewStore(self.store, observe: { $0 }) { viewStore in
      VStack(spacing: 10) {

      }
      .onAppear {
        viewStore.send(.onAppear)
      }
    }
  }
}

struct TemplateView_Previews: PreviewProvider {
  static var previews: some View {
    TemplateView(
      store: Store(initialState: Template.State()) {
        Template()
      }
    )
  }
}
