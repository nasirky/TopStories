//
//  ViewModelTests.swift
//  TopStoriesTests
//
//  Created by Ghulam Nasir on 8/25/18.
//  Copyright © 2018 Ghulam Nasir. All rights reserved.
//

import XCTest
@testable import TopStories

class ViewModelTests: XCTestCase {
    var storyItem: StoryItem!
    var storyDetailViewModel: StoryDetailViewModel?
    var itemDict: [String: Any] = [:]
    
    override func setUp() {
        super.setUp()
        let response = """
                {"section":"U.S.",
                "subsection":"Politics",
                "title":"Inquiry",
                "url":"https://nyt.com/1",
                "byline":"By MATT APUZZO",
                "abstract": "This is a test article",
                "multimedia":[{
                            "url":"https://nyt.com/thumbStandard.jpg","format":"Standard Thumbnail","height":75,"width":75},
                            {"url":"https://nyt.com/thumbLarge.jpg","format":"thumbLarge","height":75,"width":75},
                            {"url":"https://nyt.com/mediumThreeByTwo210.jpg","format":"mediumThreeByTwo210","height":75,"width":75}
                            ]
                }
                """

        do {
            guard let responseData = response.data(using: .utf8) else {
                throw NSError()
            }
            
            itemDict = try JSONSerialization.jsonObject (with: responseData, options: []) as! [String: Any]
            let jsonDecoder = JSONDecoder()
            storyItem = try jsonDecoder.decode(StoryItem.self, from: responseData)
            storyDetailViewModel = StoryDetailViewModel(with: storyItem)
        } catch (let error) {
            XCTFail("Unable to initialize test variables: \(error)")
        }
    }
    
    override func tearDown() {
        super.tearDown()
        itemDict.removeAll()
        storyDetailViewModel = nil
    }

    ///Testing to make sure StoryItem Model and StoryDetailViewModel are correctly created and intiailized
    //The reason for using StoryDetailViewModel instead of StoryItemViewModel is that by testing StoryDetailViewModel, we are testing StoryItemViewModel indireclty (StoryDetailViewModel is subclass of StoryItemViewModel)
    func testStoryItemModelAndVMCreation() {
        XCTAssertNotNil(storyDetailViewModel)
        
        XCTAssertEqual(storyDetailViewModel?.title, itemDict["title"] as? String)
        XCTAssertEqual(storyDetailViewModel?.author, itemDict["byline"] as? String)
        XCTAssertEqual(storyDetailViewModel?.description, itemDict["abstract"] as? String)
        XCTAssertEqual(storyDetailViewModel?.viewTitle, itemDict["subsection"] as? String)
        
        let multimedia = itemDict["multimedia"] as? [[String:Any]]

        let thumbnailUrlString = multimedia?.filter({ (media) -> Bool in
            return (media["format"] as? String) == "thumbLarge"
        }).first?["url"] as? String

        let imageUrlString = multimedia?.filter({ (media) -> Bool in
            return (media["format"] as? String) == "mediumThreeByTwo210"
        }).first?["url"] as? String

        XCTAssertNotNil(thumbnailUrlString)
        XCTAssertNotNil(imageUrlString)
        
        XCTAssertEqual(storyDetailViewModel?.thumbnailUrl, URL(string: thumbnailUrlString!))
        XCTAssertEqual(storyDetailViewModel?.imageUrl, URL(string: imageUrlString!))
    }
}
