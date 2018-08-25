//
//  Task.swift
//  TopStories
//
//  Created by Ghulam Nasir on 8/24/18.
//  Copyright © 2018 Ghulam Nasir. All rights reserved.
//

import Foundation
protocol Task {
    associatedtype T
    
    typealias successClosure = ((T) -> Void)?
    typealias failureClosure = ((String) -> Void)?
    
    var request: Request {get}
    
    func execute(in service: Service,
                 onSuccess success: successClosure,
                 onFailure failure: failureClosure)
}
