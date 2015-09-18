//
//  CloudTodoManagerTests.swift
//  Todo
//
//  Created by Changshin Lee on 2015. 9. 15..
//  Copyright © 2015년 SKP. All rights reserved.
//

import Foundation
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
    
    func testGetList() {
        let expectation = self.expectationWithDescription("fetch todo list")
        let manager = TodoManager.sharedManager
        manager.getList { (count) in
            XCTAssertEqual(manager.numberOfTodos(), count)
            XCTAssertNotNil(manager.todoAt(0))
            expectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5.0, handler: nil)
    }
    
    func testAddTodo() {
        let expectation = self.expectationWithDescription("add todo")
        let manager = TodoManager.sharedManager
        manager.addTodo("Test4", dueDate: NSDate()) { (result) in
            XCTAssertTrue(result)
            expectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5.0, handler: nil)
    }
}
