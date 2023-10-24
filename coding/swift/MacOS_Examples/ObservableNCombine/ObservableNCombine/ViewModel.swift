//
//  ViewModel.swift
//  ObservableNCombine
//
//  Created by 문철현 on 2023/10/24.
//

import SwiftUI
import Combine

class FirstObject: ObservableObject {
  @ObservedObject var secondObject: SecondObject
  @Published var value: Int
  @Published var secondValue: Int
  
  private var cancelable: AnyCancellable?
  
  init(secondObject: SecondObject) {
    print("FirstObject init")
    
    self._secondObject = ObservedObject(wrappedValue: secondObject)
    self.value = 0
    self.secondValue = 0
    
    // MARK: Combine을 이용해서 SecondObject.value <-> self.secondValue 를 바인딩 해준다.
    self.cancelable = secondObject.$value
      .sink(receiveValue: { [weak self] value in
        guard let self = self else { return }
        
        self.secondValue = value
      })
  }
  
  public func increase() {
    self.value += 1
  }
  
  public func decrease() {
    self.value -= 1
  }
  
  public func secondIncrease() {
    self.secondValue += 1
  }
  
  public func secondDecrease() {
    self.secondValue -= 1
  }
}

class SecondObject: ObservableObject {
  @Published var value: Int
  
  init() {
    print("SecondObject init")
    
    self.value = 0
  }
  
  public func increase() {
    self.value += 1
  }
  
  public func decrease() {
    self.value -= 1
  }
}
