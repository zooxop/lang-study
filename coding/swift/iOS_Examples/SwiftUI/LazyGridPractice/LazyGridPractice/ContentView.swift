//
//  ContentView.swift
//  LazyGridPractice
//
//  Created by 문철현 on 2023/03/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var keyboardScroller = KeyboardScroll()
    
    @State var text: String = ""
    @Namespace var buttonId
    
    var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    let columns = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                Button {
                    withAnimation {
                        proxy.scrollTo(2)
                    }
                } label: {
                    Text("Go to 10")
                }

                LazyVGrid(columns: columns) {
                    ForEach(0...3, id: \.self) { num in
                        ZStack {
                            Color.orange.frame(width: screenWidth, height: 100)
                            
                            Text("\(num)")
                        }
                    }
                    
                    TextField("haha", text: $text)
                    
                    Button {
                        print("haha")
                    } label: {
                        Text("Login Button")
                            .font(.largeTitle)
                    }
                    .id(buttonId)
                }
            }
            .onChange(of: keyboardScroller.isKeyboardShow) { newValue in
                if newValue == true {
                    withAnimation {
                        proxy.scrollTo(buttonId)
                    }
                } else {
                    withAnimation {
                        proxy.scrollTo(0)
                    }
                }
            }
        }
        .onAppear {
            keyboardScroller.addObservers()
        }
        .onDisappear {
            keyboardScroller.removeObservers()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class KeyboardScroll: ObservableObject {
    
    @Published public var isKeyboardShow = false
    
    func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardUp), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDown), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func removeObservers() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardUp(notification:NSNotification) {
        isKeyboardShow = true
    }
    
    @objc func keyboardDown(notification: NSNotification) {
        isKeyboardShow = false
    }
}
