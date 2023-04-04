//
//  StateObjectTestView.swift
//  StackOverflowTest
//
//  Created by 문철현 on 2023/04/04.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var count: Int = 0
}

struct StateObjectTestView: View {
    @StateObject var viewModel = ViewModel()
    
    @State var isPresented: Bool = false
    @State var isPresented2: Bool = false
    @State var test: String = ""
    
    var body: some View {
        VStack {
            Text(self.test)
            Button {
                self.viewModel.count += 1
                self.isPresented.toggle()
            } label: {
                Text("Call Modal sheet")
            }
        }
        .sheet(isPresented: self.$isPresented) {
//            Text("Count : \(self.viewModel.count)")
//
//            Button {
//                self.test = "Hello"
//            } label: {
//                Text("try change to @State variable from mother View")
//            }
            SheetViewTest {
                self.test = "asdf"
            }
        }
        .sheet(isPresented: self.$isPresented2) {
            Text("Count : \(self.viewModel.count)")

            Button {
                self.test = "Hello"
            } label: {
                Text("try change to @State variable from mother View")
            }
        }
    }
}

struct SheetViewTest: View {
    @Environment(\.dismiss) private var dismiss

    let action: () -> Void
    
    var body: some View {
        Button {
            action()
            dismiss()
        } label: {
            Text("Button")
        }
    }
}

struct StateObjectTestView_Previews: PreviewProvider {
    static var previews: some View {
        StateObjectTestView()
    }
}
