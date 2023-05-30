//
//  NextViewModel.swift
//  LinkNavigatorPractice
//
//  Created by 문철현 on 2023/05/30.
//

import Foundation
import LinkNavigator

class NextViewModel: ObservableObject {
    @Published public var count: Int = 0
    
    let navigator: LinkNavigatorType
    
    init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }

}
