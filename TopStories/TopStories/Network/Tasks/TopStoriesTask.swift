//
//  TopStoriesTask.swift
//  TopStories
//
//  Created by Ghulam Nasir on 8/24/18.
//  Copyright © 2018 Ghulam Nasir. All rights reserved.
//

import Foundation
struct TopStoriesTask: Task {
    typealias T = StoriesList

    var request: Request {
       return APIRequest.fetchTopStories
    }
    
    func execute(in service: Service, onSuccess success: ((StoriesList) -> Void)?, onFailure failure: Task.failureClosure) {
        service.execute(request) { response in
            switch response {
            case .response(let apiResponse):
                let list = StoriesList.init(with: apiResponse.items)
                DispatchQueue.main.async {
                    success?(list)
                }
            case .error(let error):
                DispatchQueue.main.async {
                    failure?(error)
                }
            }
        }
    }
    
}
