//
//  Request.swift
//  TopStories
//
//  Created by Ghulam Nasir on 8/24/18.
//  Copyright © 2018 Ghulam Nasir. All rights reserved.
//

import Foundation
public protocol Request {
    var path: String {get}
    var method: HTTPMethod {get}
    var parameters: [String: AnyObject]? {get}
    var headers: [String: String]? {get}
    var responseParser: ResponseParser {get}
    
    func urlRequest(for service: Service) -> URLRequest
}

extension Request {
    func urlRequest(for service: Service) -> URLRequest {
        let baseUrl = service.baseUrl.appending(path) as String
        var urlRequest = URLRequest(url: URL(string: baseUrl)!)
        switch self.method {
        case .get:
            if var urlComponents = URLComponents(string: baseUrl) {
                urlComponents.queryItems = getQueryItems(for: baseUrl, parameters)
                urlRequest.url = urlComponents.url
            }
        default:
            break
        }
        
        self.headers?.forEach({ (key, value) in
            urlRequest.setValue(key, forHTTPHeaderField: value)
        })
        
        urlRequest.httpMethod = method.rawValue
        
        return urlRequest
    }
    
    private func getQueryItems(for url: String,_ parameters: [String: Any]?) -> [URLQueryItem] {
        // assuming all parameters to be string
        guard let parameters = parameters as? [String:String] else {
            return [URLQueryItem]()
        }
        
        let queryItems = parameters.map { param in
            return URLQueryItem(name: param.key, value: param.value)
        }
        
        return queryItems
    }

}
