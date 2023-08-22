//
//  TCASimplePracticeTests.swift
//  TCASimplePracticeTests
//
//  Created by 문철현 on 2023/08/22.
//

import XCTest
import ComposableArchitecture
@testable import TCASimplePractice

final class TCASimplePracticeTests: XCTestCase {

    @MainActor
    func testFeature() async {
        let store = TestStore(initialState: Feature.State()) {
            Feature()
        }
        await store.send(.incrementButtonTapped) {
            $0.count = 1
        }
        await store.send(.decrementButtonTapped) {
            $0.count = 0
        }

        await store.send(.numberFactButtonTapped)

        await store.receive(.numberFactResponse("10")) {
            $0.numberFactAlert = "10"
        }
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
