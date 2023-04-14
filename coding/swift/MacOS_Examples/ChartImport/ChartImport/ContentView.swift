//
//  ContentView.swift
//  ChartImport
//
//  Created by 문철현 on 2023/04/14.
//

import SwiftUI
import Charts

struct WeatherTemperature: Identifiable {
    let id = UUID()
    let temp: Double
    let time: Int
}

struct ContentView: View {
    let entries = [
        WeatherTemperature(temp: 10, time: 1680622832),
        WeatherTemperature(temp: 14, time: 1680622932)
    ]
    
    var body: some View {
        Chart {
            ForEach(entries) { entry in
                LineMark(x: .value("Time", entry.time),
                         y: .value("Temp", entry.temp))
                .foregroundStyle(.red)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
