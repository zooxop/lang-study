//
//  ContentView.swift
//  SwiftUI_Lecture3
//
//  Created by 문철현 on 2022/12/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        VStack(spacing: 10) {
//            Text("Hello")
//                .background(Color.blue)
//            Text("Hello")
//                .background(Color.blue)
//
//            Image("1")
//                .resizable()  // 이걸 안써주면 크기가 안바뀐다.
//                // .frame(width: 300)
//                // .padding()
//                .edgesIgnoringSafeArea(.all)
//                .aspectRatio(contentMode: .fit)  // 비율 자동 조정
//                .mask({
//                    Circle()
//                })
//                .padding(.bottom, 20)
//
//            Image("1")
//                .resizable()
//                .edgesIgnoringSafeArea(.all)
//                .aspectRatio(contentMode: .fit)
//        }
        VStack(spacing: 0) {
            Image("1")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                // .aspectRatio(contentMode: .fit)
                .mask(
                    HStack(spacing: 0) {
                        VStack(spacing: 0) {
                            Circle()
                            Circle()
                            Circle()
                            Circle()
                            Circle()
                        }
                        VStack(spacing: 0) {
                            Circle()
                            Circle()
                            Circle()
                            Circle()
                            Circle()
                        }
                        VStack(spacing: 0) {
                            Circle()
                            Circle()
                            Circle()
                            Circle()
                            Circle()
                        }
                        VStack(spacing: 0) {
                            Circle()
                            Circle()
                            Circle()
                            Circle()
                            Circle()
                        }
                        VStack(spacing: 0) {
                            Circle()
                            Circle()
                            Circle()
                            Circle()
                            Circle()
                        }
                    }
                )
                .frame(width: 300, height: 300)
        }
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
