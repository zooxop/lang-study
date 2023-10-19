//
//  ContentView.swift
//  ScrollViewReaderTest
//
//  Created by 문철현 on 2023/10/19.
//

import SwiftUI

struct ContentView: View {
  @Namespace var id
  @State var showPicker: Bool = false
  @State var date: Date = Date()
  
  var body: some View {
    ScrollViewReader { scrollViewReader in
      ScrollView(.vertical) {
        Color.red.frame(height: 400)
        
        Color.yellow.frame(height: 200)
        
        VStack {
          
          
          LazyVStack {
            Button(action: {
              showPicker.toggle()
            }, label: {
              Text("Show picker")
            })
            .padding(10)
            
            DatePicker(selection: $date,
                       displayedComponents: .date,
                       label: { EmptyView() })
            .labelsHidden()
            .datePickerStyle(.graphical)
            .id(id)
            .isHidden(!showPicker)
            
            
          }
          .border(Color.green)
          
          Color.blue.frame(height: 500)
        }
      }
      .onChange(of: showPicker) { newValue in
        if newValue {
          DispatchQueue.main.async {
            withAnimation {
              scrollViewReader.scrollTo(id, anchor: nil)
            }
          }
        }
      }
    }
  }
}

extension View {
  @ViewBuilder func isHidden(_ isHidden: Bool) -> some View {
    if isHidden {
      self.hidden()
    } else {
      self
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
