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
    @State var isShow: Bool = false
    
//    init(preventViewModel: NextViewModel) {
//        self.viewModel = preventViewModel
//    }
    
    var body: some View {
        ZStack {
            VStack {
                Text("Next View")
                    .font(.title)
                Text(viewModel.count.description)
                    .padding()
                
                Button("Up") {
                    viewModel.count += 1
                }
                
                Button("show") {
                    isShow.toggle()
                }
            }
            
            if isShow {
                test()
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                VStack {
                    HStack(spacing: 2) {
                        Image(systemName: "chevron.left")
                            .resizable()
                        Text("|")
                            .font(.system(size: 20))
                            .foregroundColor(.gray)
                            .bold()
                        Text("test")
                            .font(.system(size: 15))
                            .foregroundColor(.gray)
                            .bold()
                            .padding(.top, 5)
                    }
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
    //                coordinator.push(destination: .menuListView)
                } label: {
                    Image(systemName: "chevron.right")
                        .resizable()
                        .padding(.trailing, 5)
                }
            }
        }
    }
    
    @ViewBuilder
    func test() -> some View {
        ZStack {
            Color.gray.ignoresSafeArea().opacity(0.3)
            
            Button("close") {
                isShow.toggle()
            }
        }
    }
}
