//
//  Service.swift
//  TopStories
//
//  Created by Ghulam Nasir on 8/24/18.
//  Copyright © 2018 Ghulam Nasir. All rights reserved.
//

import Foundation
public protocol Service {
    var baseUrl: String {get}
    
    init(withUrl url: String)
    
    typealias completionHandler = (Response) -> ()
    
    func execute(_ request: Request, onCompletion completionHandler: @escaping completionHandler)
}
