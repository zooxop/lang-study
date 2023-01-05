//
//  ViewModel.swift
//  MVVMSample
//
//  Created by 문철현 on 2023/01/05.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var ham = Person(name: "ham", birthday: Date())
    
    var name: String {
        return ham.name
    }
    var age: String {
        return "28"
    }
    
    func changeName(_ name: String) {
        ham.name = name
    }
}
