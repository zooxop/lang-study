//
//  ContentView.swift
//  EnvironmentObjectPractice
//
//  Created by 문철현 on 2023/03/14.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var userSetting = UserSetting()
        
    var body: some View {
        VStack {
            Text("\(self.userSetting.score)")
                .font(.largeTitle)
            Button("클릭시 score 상승") {
                self.userSetting.score += 1
            }
            //구분선 추가
            Divider()
                .padding()
            
            //바인딩해서 가져오기때문에 $표시
            MyScoreView(score: self.$userSetting.score)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
