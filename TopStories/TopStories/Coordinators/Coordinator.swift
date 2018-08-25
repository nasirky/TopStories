//
//  Coordinator.swift
//  TopStories
//
//  Created by Ghulam Nasir on 8/24/18.
//  Copyright © 2018 Ghulam Nasir. All rights reserved.
//

import UIKit

protocol Coordinator {
    func storyboard() -> UIStoryboard
    func start()
}

extension Coordinator {
    func storyboard() -> UIStoryboard {
        return UIStoryboard.init(name: "Main", bundle: nil)
    }
}
