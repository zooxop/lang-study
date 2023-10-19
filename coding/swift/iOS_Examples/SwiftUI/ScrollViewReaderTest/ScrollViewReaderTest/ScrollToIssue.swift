//
//  ScrollToIssue.swift
//  ScrollViewReaderTest
//
//  Created by 문철현 on 2023/10/19.
//

import SwiftUI

struct ScrollToIssue: View {
  @State var showPicker: Bool = false
  @State var date: Date = Date()
  
  var body: some View {
    ScrollViewReader { scrollViewReader in
      ScrollView {
        
        Color.red.frame(height: 400)
        
        Color.yellow.frame(height: 200)
        
        LazyVStack {  // 👀 Instead of VStack
          Button(action: {
            showPicker.toggle()
            
            if showPicker {
              DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                withAnimation {
                  scrollViewReader.scrollTo("pickerrrr")
                }
              })
            }
          }, label: {
            Text("Show picker")
          })
          
          if showPicker {
            DatePicker(selection: $date,
                       displayedComponents: .date,
                       label: { EmptyView() })
            .labelsHidden()
            .datePickerStyle(GraphicalDatePickerStyle())
            .id("pickerrrr")
          }
        }
        .border(Color.green)
        
        Color.blue.frame(height: 500)
      }
    }
  }
}

struct ScrollToIssue_Previews: PreviewProvider {
  static var previews: some View {
    ScrollToIssue()
  }
}
