//
//  ContentView.swift
//  AlertView
//
//  Created by 문철현 on 2022/12/29.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShowAlert = false
    
    @State private var selectText = "x"
    
    var body: some View {
        VStack {
            Spacer()
            
            Button("show Alert") {
                isShowAlert.toggle()
            }
            .alert(isPresented: $isShowAlert) {
                let primaryButton = Alert.Button.default(Text("done")) {
                    // Action은 여기에 작성하면 됨.
                    selectText = "done"
                }
                let secondaryButton = Alert.Button.default(Text("cancel")) {
                    selectText = "cancel"
                }
                
                return Alert(title: Text("show alert"), primaryButton: primaryButton, secondaryButton: secondaryButton)
            }
            Spacer()
            Text("\(isShowAlert.description)")
            Spacer()
            Text("\(selectText)")
            Spacer()
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
