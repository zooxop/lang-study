//
//  Next.swift
//  LinkNavigatorPractice
//
//  Created by 문철현 on 2023/05/30.
//

import SwiftUI
import LinkNavigator

struct NextView: View {
    @StateObject var viewModel: NextViewModel
    
//    init(preventViewModel: NextViewModel) {
//        self.viewModel = preventViewModel
//    }
    
    var body: some View {
        VStack {
            Text("Next View")
                .font(.title)
            Text(viewModel.count.description)
                .padding()
            
            Button("Up") {
                viewModel.count += 1
            }
        }
    }
}
