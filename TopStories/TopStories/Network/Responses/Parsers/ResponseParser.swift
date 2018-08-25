//
//  ResponseParser.swift
//  TopStories
//
//  Created by Ghulam Nasir on 8/24/18.
//  Copyright © 2018 Ghulam Nasir. All rights reserved.
//

import Foundation
public protocol ResponseParser {
    var responseType: APIResponse.Type {get}
    
    init(with responseType: APIResponse.Type)
    
    func parse(_ data: Data) throws -> (APIResponse)
}
