//
//  LazyVVIew.swift
//  ScrollViewReaderTest
//
//  Created by 문철현 on 2023/10/19.
//

import SwiftUI

struct LazyVView: View {
  var body: some View {
    ScrollViewReader { proxy in
      ScrollView {
        VStack {
          Color.yellow
            .frame(height: 800)
          
          ScrollButton(proxy: proxy)
        }
      }
    }
  }
}

struct ScrollButton: View {
  let proxy: ScrollViewProxy
  
  @Namespace var bottomId
  
  var body: some View {
    LazyVStack {
      Button("Scroll") {
        withAnimation {
          proxy.scrollTo(bottomId)
        }
      }
      Color.red
        .frame(height: 500)
        .id(bottomId)
    }
  }
}

struct LazyVView_Previews: PreviewProvider {
  static var previews: some View {
    LazyVView()
  }
}
