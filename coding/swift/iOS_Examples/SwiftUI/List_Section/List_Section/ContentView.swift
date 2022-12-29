//
//  ContentView.swift
//  List_Section
//
//  Created by 문철현 on 2022/12/29.
//

import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    
    let name: String
    let index: Int
}

struct ContentView: View {
    
    var animalList = [
        Animal(name: "dog", index: 3),
        Animal(name: "dog", index: 2),
        Animal(name: "bird", index: 7),
        Animal(name: "cat", index: 4),
        Animal(name: "dog", index: 1),
        Animal(name: "bird", index: 8),
        Animal(name: "cat", index: 6),
        Animal(name: "cat", index: 5),
        Animal(name: "bird", index: 9)
    ]
    
    // Dictionary grouping
    var animalGrouped: [String: [Animal]] {
        var groupData = Dictionary.init(grouping: animalList) { $0.name }
        
        for (key, value) in groupData {
            groupData[key] = value.sorted(by: {$0.index < $1.index})
        }
        
        return groupData
    }
    
    var groupKey: [String] {
        animalGrouped.map { $0.key }
    }
    
    var body: some View {
        
        List {
            ForEach(groupKey, id: \.self) { animalKey in
                Section(header: Text("\(animalKey)")) {
                    ForEach(animalGrouped[animalKey]!) { animal in
                        HStack {
                            Text("\(animal.name)")
                            Text("\(animal.index)")
                        }
                    }
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
