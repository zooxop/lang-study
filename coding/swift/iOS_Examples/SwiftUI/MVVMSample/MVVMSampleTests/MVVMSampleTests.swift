//
//  MVVMSampleTests.swift
//  MVVMSampleTests
//
//  Created by 문철현 on 2023/10/10.
//

import XCTest
@testable import MVVMSample

class MockDataService: DataService {
  func getUsers(completion: @escaping ([User]) -> Void) {
    completion([User(id: 1, name: "Kilo Loco")])
  }
}

final class MVVMSampleTests: XCTestCase {

  var sut: UsersView.ViewModel!  // System Under Test
  
  override func setUpWithError() throws {
    sut = UsersView.ViewModel(dataService: MockDataService())
  }
  
  override func tearDownWithError() throws {
    sut = nil
  }
  
  func test_getUsers() throws {
    XCTAssertTrue(sut.users.isEmpty)
    
    sut.getUsers()
    
    XCTAssertEqual(sut.users.count, 1)
  }
}
