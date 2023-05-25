//
//  ContentView.swift
//  MultpleThreadWithStatic
//
//  Created by 문철현 on 2023/05/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    @State var count = 0
    
    private func startTask() {
        Task {
            _ = try await viewModel.trySleep()
            print("call")
        }
    }
    
    private func startTaskFifth() {
        Task {
            for i in 0..<5 {
                
                let result = try await viewModel.trySleep()
                print("call \(i) / result : \(result)")
                if result == true {
                    break
                }
            }
        }
    }
    
    var body: some View {
        VStack {
            Text("Count : \(count)")
                .padding()
            
            HStack {
                Button {
                    startTask()
                } label: {
                    Text("Start Once")
                }
                
                Button {
                    startTaskFifth()
                } label: {
                    Text("Start Fifth")  // until success
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class ViewModel: ObservableObject {
    
    func trySleep() async throws -> Bool {
        try await Task.sleep(nanoseconds: 1_000_000_000)
        if Int.random(in: 0...3) == 2 {
            return false
        } else {
            return true
        }
    }
}
