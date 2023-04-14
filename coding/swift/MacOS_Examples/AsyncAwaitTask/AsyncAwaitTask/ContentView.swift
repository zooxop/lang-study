//
//  ContentView.swift
//  AsyncAwaitTask
//
//  Created by 문철현 on 2023/04/12.
//

import SwiftUI

struct ContentView: View {
    @State var result: String = "asdf"
    @State var test: Bool = false
    @State var count = 0
    @State var testCount = 0
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(result)
            Text(testCount.description)
            
            Button {
                Task {  // 비동기 동작들을 동기로 처리할 수 있게 해준다.
                    print("start")
                    test = await test1()
                    testCount = count
                    if test == true {
                        result = "True"
                    } else {
                        result = "False"
                    }
                    
                    _ = testWhileReturn()
                }
            } label: {
                Text("Go Go")
            }
        }
        .padding()
    }
    
    func test1() async -> Bool {
        for _ in 0...1000000 {
            self.count += 1
        }
        print("for문 끝")
        test.toggle()
        return test
    }
    
    func testWhileReturn() -> Bool {
        var count = 0
        
        while count < 50 {
            count += 1
            
            if count == 5 {
                return false
            }
            print(count)
        }
        
        return true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
