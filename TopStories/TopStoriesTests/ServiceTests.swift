//
//  ServiceTests.swift
//  TopStoriesTests
//
//  Created by Ghulam Nasir on 8/25/18.
//  Copyright © 2018 Ghulam Nasir. All rights reserved.
//

import XCTest
@testable import TopStories

/// Testing PublicService. Support for calling the API as well as stubbing (mocked response) the API response
class ServiceTests: XCTestCase {
    var helper: Helper?
    
    override func setUp() {
        super.setUp()
        helper = Helper()
    }
    
    override func tearDown() {
        super.tearDown()
        
        helper = nil
    }
    
    /// Testing Public Photos Task with Mocked response
    func testMockedTopStoriesTask() {
        guard let fileContents = helper?.fetchFileContent(from: "top_stories", withExtension: "json") else {
            XCTFail("Error reading file")
            return
        }
        
        let mockService = APIMockService(withResponse: fileContents)
        testTopStoriesTask(with: mockService) { list in
            //Additional testing
            XCTAssertTrue(list.items.count == 46)
            XCTAssertTrue(list.items.first?.subsection == "Politics")
            XCTAssertTrue(list.items.first?.title == "What Will Mueller Do? The Answer Might Lie in a By-the-Book Past")
        }
    }
    
    /// Testing TopStories Task with real network call
    func testTopStoriesTask() {
        let service = APIService(withUrl: ApiConstants.NYTimesApi.Urls.Services)
        testTopStoriesTask(with: service)
    }
    
    
    /// Generic function for testing public photos task
    func testTopStoriesTask(with service: Service, onSuccess successCallback: (((StoriesList) -> Void)?) = nil) {
        let testExpectation = expectation(description: "Expecting TopStories feed")
        
        let task = TopStoriesTask()
        task.execute(in: service, onSuccess: { list in
            testExpectation.fulfill()
            XCTAssertTrue(list.items.count > 0)
            
            successCallback?(list)
        }) { (error) in
            testExpectation.fulfill()
            XCTFail("Error : \(error)")
        }
        
        waitForExpectations(timeout: 15) { (error) in
            if let error = error {
                XCTFail("Error :\(error)")
            }
        }
        
    }
}

