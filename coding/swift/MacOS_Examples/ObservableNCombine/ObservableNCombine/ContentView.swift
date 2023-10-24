//
//  ContentView.swift
//  ObservableNCombine
//
//  Created by 문철현 on 2023/10/24.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var viewModel: FirstObject
  
  init(viewModel: FirstObject) {
    self._viewModel = ObservedObject(wrappedValue: viewModel)
  }
  
  var body: some View {
    VStack {
      VStack {
        Image(systemName: "globe")
          .imageScale(.large)
          .foregroundColor(.accentColor)
          .padding()
        
        Text("First: \(viewModel.value.description)")
          .padding()
        
        HStack {
          Button("-1") {
            viewModel.decrease()
          }
          .padding()
          
          Button("+1") {
            viewModel.increase()
          }
          .padding()
        }
      }
      .background(Color.blue.opacity(0.2))
      
      VStack {
        Image(systemName: "comb")
          .imageScale(.large)
          .foregroundColor(.accentColor)
          .padding()
        
        Text("Second: \(viewModel.secondValue.description)")
          .padding()
        
        HStack {
          Button("-1") {
            viewModel.secondDecrease()
          }
          .padding()
          
          Button("+1") {
            viewModel.secondIncrease()
          }
          .padding()
        }
      }
      .background(Color.red.opacity(0.2))
    }
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(viewModel: FirstObject(secondObject: SecondObject()))
  }
}
