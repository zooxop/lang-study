//
//  Test.swift
//  ChartImport
//
//  Created by 문철현 on 2023/04/14.
//

import SwiftUI
import Charts


struct WeatherTemperature2: Identifiable {
    let id = UUID()
    let temp: Double
    let time: Int
}

struct Test: View {
    let entries = [
        WeatherTemperature2(temp: 10, time: 1680622832),
        WeatherTemperature2(temp: 14, time: 1680622932)
    ]
    
    var body: some View {
        VStack {
            Chart(self.entries) { entry in
                LineMark(x: .value("Time", entry.time),
                         y: .value("Temp", entry.temp))
                .foregroundStyle(.red)
            }
        }
    }
}

