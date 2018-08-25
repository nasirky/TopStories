//
//  APIResponse.swift
//  TopStories
//
//  Created by Ghulam Nasir on 8/24/18.
//  Copyright © 2018 Ghulam Nasir. All rights reserved.
//

import Foundation
public class APIResponse: Codable {
    typealias T = StoryItem
    
    var items: [T]?
    var error: String?
    
    private enum CodingKeys: String, CodingKey {
        case items = "results"
        case error = "message"
    }
    
    // Implementing own decoder to provide default values for missing keys
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.decodeIfPresent([T].self, forKey: .items) ?? nil
        self.error = try container.decodeIfPresent(String.self, forKey: .error) ?? nil
    }
}

