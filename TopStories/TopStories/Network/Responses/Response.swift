//
//  Response.swift
//  TopStories
//
//  Created by Ghulam Nasir on 8/24/18.
//  Copyright © 2018 Ghulam Nasir. All rights reserved.
//

import Foundation
public enum Response {
    case error(_: String)
    case response(_: APIResponse)
    
    init(with data: Data?, _ error: Error?, parsedBy parser: ResponseParser) {
        if let error = error {
            self = .error(error.localizedDescription)
            return
        }
        
        guard let data = data else {
            self = .error(ApiConstants.Error.NoData)
            return
        }
        
        do {
            let response = try parser.parse(data)
            if let errorString = response.error {
                self = .error(errorString)
                return
            }
            self = .response(response)
        } catch (let error) {
            self = .error(error.localizedDescription)
        }
    }
}
