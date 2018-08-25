//
//  JSONResponseParser.swift
//  TopStories
//
//  Created by Ghulam Nasir on 8/24/18.
//  Copyright © 2018 Ghulam Nasir. All rights reserved.
//

import Foundation

struct JSONResponseParser: ResponseParser {
    var responseType: APIResponse.Type
    
    init(with responseType: APIResponse.Type = APIResponse.self) {
        self.responseType = responseType
    }
    
    func parse(_ data: Data) throws -> (APIResponse) {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        do {
            return try jsonDecoder.decode(responseType.self, from: data)
        } catch let error {
            throw error
        }
    }
}
