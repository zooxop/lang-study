//
//  CrashSheets.swift
//  StackOverflowTest
//
//  Created by 문철현 on 2023/04/04.
//

import SwiftUI

enum Test: Identifiable {
    case one
    case two
    
    var id: String {
        switch self {
        case .one : return "One"
        case .two : return "Two"
        }
    }
}

struct SheetView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var showingFirst: Test?
    @State private var showingSecond: Test?
    @Binding var testt: String

    var body: some View {
        VStack {
            Button("Show First Sheet") {
                showingFirst = .one
            }
        }
        .sheet(item: $showingFirst) { tt in
            FirstSheetiew {
                showingSecond = .two
            }
        }
        .sheet(item: $showingSecond) { tt in
            VStack {
                Text("Second Sheet")
                Button("Dismiss") {
                    dismiss()
                }
            }
        }
    }
}

struct FirstSheetiew: View {
    @Environment(\.dismiss) private var dismiss

    let action: () -> Void
    
    var body: some View {
        VStack {
            Text("First Sheet")
            Button("Dismiss") {
                //action()  <-- 👀 remove
                dismiss()
            }
        }
        .onDisappear {  //<-- 👀 add
            action()
        }
    }
}
