//
//  ContentView.swift
//  SwiftUIMarkDown
//
//  Created by 문철현 on 2023/09/20.
//

import SwiftUI

struct ContentView: View {
  @State var text: String = "~~TEXT~~"
  @State var array: [String] = ["**Test1**", "# head1"]
  
  var body: some View {
    VStack {
      Text(.init(text))
      
      //ForEach
      Text(.init(array[0]))
      Text(.init(array[1]))
    }
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
