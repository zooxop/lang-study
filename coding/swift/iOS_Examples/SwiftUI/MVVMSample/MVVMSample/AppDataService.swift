//
//  AppDataService.swift
//  MVVMSample
//
//  Created by 문철현 on 2023/10/10.
//

import Foundation

protocol DataService {
  func getUsers(completion: @escaping ([User]) -> Void)
}

class AppDataService: DataService {
  func getUsers(completion: @escaping ([User]) -> Void) {
    DispatchQueue.main.async {
      completion([
        User(id: 1, name: "Kyle"),
        User(id: 2, name: "Jamal"),
        User(id: 3, name: "Lee")
      ])
    }
  }
}
