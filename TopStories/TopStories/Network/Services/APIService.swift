//
//  APIService.swift
//  TopStories
//
//  Created by Ghulam Nasir on 8/24/18.
//  Copyright © 2018 Ghulam Nasir. All rights reserved.
//

import Foundation

class APIService: Service {
    var baseUrl: String
    var defaultSession: URLSession
    
    required init(withUrl url: String) {
        baseUrl = url
        defaultSession = URLSession(configuration: .default)
    }
    
    func execute(_ request: Request, onCompletion completionHandler: @escaping Service.completionHandler) {
        let dataTask = defaultSession.dataTask(with: request.urlRequest(for: self)) { (data, urlResponse, error) in
            let response = Response.init(with: data, error, parsedBy: request.responseParser)
            completionHandler(response)
        }
        
        dataTask.resume()
    }
    
    
}
