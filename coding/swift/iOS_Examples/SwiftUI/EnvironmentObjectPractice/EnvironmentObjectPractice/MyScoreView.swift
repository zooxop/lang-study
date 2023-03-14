//
//  MyScoreView.swift
//  EnvironmentObjectPractice
//
//  Created by 문철현 on 2023/03/14.
//

import SwiftUI

struct MyScoreView: View {
    
    //UserSetting의 score을 바인딩해서 가져옴
    @Binding var score: Int
    
    var body: some View {
        VStack {
            Text("\(self.score)")
            Button("클릭시 score 증가") {
                self.score += 1
            }
            .padding()
            .background(Color.orange)
            .foregroundColor(.black)
            
        }
        .padding()
        .background(Color.yellow)
    }
}
 
struct MyScoreView_Previews: PreviewProvider {
    static var previews: some View {
        //바인딩해온 값을 .constant값으로 설정
        MyScoreView(score: .constant(0))
    }
}
