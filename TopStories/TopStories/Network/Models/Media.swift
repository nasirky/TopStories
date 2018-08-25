//
//  Media.swift
//  TopStories
//
//  Created by Ghulam Nasir on 8/24/18.
//  Copyright © 2018 Ghulam Nasir. All rights reserved.
//

import Foundation
struct Media: Codable {
    let url: String
    let format: String
    
    private enum CodingKeys: String, CodingKey {
        case url
        case format
    }
}
