//
//  MockService.swift
//  TopStories
//
//  Created by Ghulam Nasir on 8/25/18.
//  Copyright © 2018 Ghulam Nasir. All rights reserved.
//

import UIKit

class APIMockService: APIService {
    /// Stores the mocked response
    public var response: String

    required init(withUrl url: String) {
        self.response = ""

        super.init(withUrl: url)
    }

    init(withResponse response: String) {
        self.response = response
        
        super.init(withUrl: "")
    }
    
    override func execute(_ request: Request, onCompletion: @escaping (Response) -> ()) {
        onCompletion(Response(with: response.data(using: .utf8), nil, parsedBy: request.responseParser))
    }
}
