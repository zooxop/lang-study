//
//  ContentView2.swift
//  StackOverflowTest
//
//  Created by 문철현 on 2023/03/14.
//

import SwiftUI

struct CustomGaugeStyleView: View {
    
    @State private var innerRingFill = 6.5
   
      var body: some View {
          Gauge(value: innerRingFill, in: 0...10) {
              Image(systemName: "gauge.medium")
                  .font(.system(size: 50.0))
          } currentValueLabel: {
              Text("\(innerRingFill.formatted(.number))")
   
          }
          .gaugeStyle(twoRingGaugeStyle(outerRingMin: 5.5, outerRingMax: 7.5))
          //.frame(height: 200)
         
      }
}

struct CustomGaugeStyleView_Previews: PreviewProvider {
    static var previews: some View {
        CustomGaugeStyleView()
    }
}



struct twoRingGaugeStyle: GaugeStyle {
    
    var outerRingMin: Double
    var outerRingMax: Double
    
    func makeBody(configuration: Configuration) -> some View {
        
GeometryReader { geometry in
    ZStack {
        Circle()
            .stroke(Color(.lightGray).opacity(0.2), style: StrokeStyle(lineWidth: 20))
            .frame(height: geometry.size.height * 0.70)
        Circle()
            .trim(from: 0, to: 0.75 * configuration.value)
            .stroke(Color.orange.gradient, style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
            .rotationEffect(.degrees(270))
            .frame(height: geometry.size.height * 0.70)
        Circle()
            .trim(from: outerRingMin / 10, to: outerRingMax / 10)
            .stroke(Color.green.gradient, style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
            .rotationEffect(.degrees(270))
            .frame(height: geometry.size.height * 0.70)  // 0.82 -> 0.70
    }
    .padding()
}
.aspectRatio(contentMode: .fit)
    }
    
}
