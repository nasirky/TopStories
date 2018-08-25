//
//  StoryItem.swift
//  TopStories
//
//  Created by Ghulam Nasir on 8/24/18.
//  Copyright © 2018 Ghulam Nasir. All rights reserved.
//

import Foundation
public struct StoryItem: Codable {
    var title: String
    var author: String
    var subsection: String
    var description: String
    var url: String
    var media: [Media]
    
    private enum CodingKeys: String, CodingKey {
        case title
        case author = "byline"
        case subsection
        case description = "abstract"
        case url
        case media = "multimedia"
    }
}
