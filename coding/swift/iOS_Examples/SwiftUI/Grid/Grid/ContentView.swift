//
//  ContentView.swift
//  Grid
//
//  Created by 문철현 on 2023/01/02.
//

import SwiftUI

struct ContentView: View {
    
    var column: [GridItem] {
//        [GridItem(.flexible(minimum: 50, maximum: 200)),
//         GridItem(.flexible(minimum: 50, maximum: 200)),
//         GridItem(.flexible(minimum: 50, maximum: 200)),
//         GridItem(.flexible(minimum: 50, maximum: 200))]
        
        
//        [GridItem(.adaptive(minimum: 50))]
        [GridItem(.fixed(100))]
    }
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: column) {
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.note")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(systemName: "music.mic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
