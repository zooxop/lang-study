//
//  DIContainer.swift
//  ObservableNCombine
//
//  Created by 문철현 on 2023/10/24.
//

import Foundation

class DIContainer {
  public static let shared: DIContainer = .init()
  
  public var firstObject: FirstObject
  public var secondObject: SecondObject
  
  private init() {
    self.secondObject = SecondObject()
    self.firstObject = FirstObject(secondObject: self.secondObject)
  }
}
