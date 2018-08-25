//
//  TopStoriesRequest.swift
//  TopStories
//
//  Created by Ghulam Nasir on 8/24/18.
//  Copyright © 2018 Ghulam Nasir. All rights reserved.
//

import Foundation
enum APIRequest: Request {
    case fetchTopStories

    var path: String {
        switch self {
        case .fetchTopStories:
            return ApiConstants.NYTimesApi.Urls.TopStories
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchTopStories:
            return .get
        }
    }
    
    var parameters: [String : AnyObject]? {
        switch self {
        case .fetchTopStories:
            return [ApiConstants.NYTimesApi.Params.ApiKey: ApiConstants.NYTimesApi.Values.ApiKey as AnyObject]
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return nil
        }
    }
    
    var responseParser: ResponseParser {
        return JSONResponseParser()
    }
    
}
