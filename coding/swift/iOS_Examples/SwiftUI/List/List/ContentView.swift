//
//  ContentView.swift
//  List
//
//  Created by 문철현 on 2022/12/29.
//

import SwiftUI

// Hashable을 준수해서 Model이 되는 구조체 자체가 ID로 사용될 수 있게함.
// Identifiable을 준수하면 ForEach 구현 시 ID를 선언하지 않아도 됨.
struct LocationInfo: Hashable, Identifiable {
    var id = UUID()
    
    var city = ""
    var weather = ""
}

struct ContentView: View {
    
    @State private var locations = [
        LocationInfo(city: "seoul", weather: "sunny"),
        LocationInfo(city: "busan", weather: "cloudy"),
        LocationInfo(city: "la", weather: "rainy"),
        LocationInfo(city: "incheon", weather: "sunny")
    ]
    
    // \. : keypath 문법
    var body: some View {
        List {
            ForEach(locations, id: \.self) { (location) in
                HStack {
                    Text("\(location.city)")
                    Text("\(location.weather)")
                }
            }
            
            ForEach(locations) { location in
                HStack {
                    Text("\(location.city)")
                    Text("\(location.weather)")
                }
            }
            
            ForEach(0..<locations.count, id: \.self) { idx in
                HStack {
                    Text("\((idx + 1))")
                    Text("\(locations[idx].city)")
                    Text("\(locations[idx].weather)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
