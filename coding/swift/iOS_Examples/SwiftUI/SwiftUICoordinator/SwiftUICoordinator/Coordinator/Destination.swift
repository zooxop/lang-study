//
//  Destination.swift
//  SwiftUICoordinator
//
//  Created by 문철현 on 2023/10/10.
//

import SwiftUI

enum Destination {
  case aView
  case bView(Product)
  case cView
  
  @ViewBuilder
  var view: some View {
    switch self {
    case .aView:
      AView()
    case .bView(let product):
      BView(product: product)
    case .cView:
      CView()
    }
  }
}
