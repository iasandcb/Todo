//
//  CloudTodoManagerTests.swift
//  Todo
//
//  Created by Changshin Lee on 2015. 9. 15..
//  Copyright © 2015년 SKP. All rights reserved.
//

import XCTest
@testable import Todo

class TodoManagerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNumberOfTodos() {
        let expectation = self.expectationWithDescription("fetch todo list")
        let manager = TodoManager.sharedManager
        manager.numberOfTodos { (count) in
            XCTAssertEqual(2, count)
            expectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5.0, handler: nil)
    }
    
}
