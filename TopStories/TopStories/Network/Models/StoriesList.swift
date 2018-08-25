//
//  StoriesList.swift
//  TopStories
//
//  Created by Ghulam Nasir on 8/24/18.
//  Copyright © 2018 Ghulam Nasir. All rights reserved.
//

import Foundation
struct StoriesList {
    var items: [StoryItem]
    
    init(with items: [StoryItem]? = nil) {
        if let items = items {
            self.items = items
        } else {
            self.items = [StoryItem]()
        }
    }
}
