//
//  CardSlideView.swift
//  StackOverflowTest
//
//  Created by 문철현 on 2023/03/28.
//

import SwiftUI

struct CardSlideView: View {
    @State var cardDealt = ""
    @State var cardDealt2 = ""  // <-- 👀 here
    @State private var dealtCard = false
    @State private var dealtCard2 = false  // <-- 👀 here
    
    @ViewBuilder
    func cardImage(_ imageName: String) -> some View {  // <-- 👀 here
        Image(imageName)
            .resizable()
            .cornerRadius(15)
            .aspectRatio(contentMode: .fit)
            .transition(.slide)
    }
    
    var body: some View {
        ZStack {
            Image("white-background")
                .resizable()
                .ignoresSafeArea()
            VStack {
                HStack {
                    Spacer()
                    if dealtCard {  // <-- 👀 here
                        cardImage(cardDealt)
                    } else if dealtCard2 {
                        cardImage(cardDealt2)
                    }
                    Spacer()
                }.shadow(radius: 4)
                
                Spacer()
                HStack {
                    Button {
                        //Action for button
                        withAnimation {
                            deal()
                        }
                        
                    } label:{
                        // How the button look
                        Text("Draw")
                            .foregroundColor(.white)
                            .padding()
                            .background(.black)
                            .cornerRadius(15.0)
                            .font(.system(size:25))
                            .fontWeight(.bold)
                    }
                    Button {
                        //Action for button
                        //dismiss()
                    } label:{
                        // How the button look
                        Text("End Game")
                            .foregroundColor(.white)
                            .padding()
                            .background(.black)
                            .cornerRadius(15.0)
                            .font(.system(size:25))
                            .fontWeight(.bold)
                    }
                }.buttonBorderShape(.capsule)
            }
        }
    }

    func deal() {  // <-- 👀 here
        let cpuCardValue = Int.random(in:1...5)
        let cpuCardValue2 = Int.random(in: 1...5)
        
        cardDealt = "card" + String(cpuCardValue)
        cardDealt2 = "card" + String(cpuCardValue2)
        
        if dealtCard == false && dealtCard2 == false {  // only the first time
            dealtCard = true
        } else {
            dealtCard.toggle()
            dealtCard2.toggle()
        }
    }
}


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        CardSlideView()
    }
}
