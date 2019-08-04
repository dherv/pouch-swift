//
//  pouchTests.swift
//  pouchTests
//
//  Created by Damien Hervieux on 2019/07/21.
//  Copyright © 2019 Damien Hervieux. All rights reserved.
//

import XCTest
@testable import pouch

class pouchTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    //MARK: Expense Class Tests
    // Confirm that the Expense initializer returns an Expense object when passed valid parameters.
    func testExpenseInitializationSucceeds() {
        
    }
    
    // Confirm that the Meal initialier returns nil when passed a negative rating or an empty name.
    func testExpenseInitializationFails() {
        // Empty String
        let emptyStringExpense = Expense.init(name: "")
        XCTAssertNil(emptyStringExpense)
    }

}
