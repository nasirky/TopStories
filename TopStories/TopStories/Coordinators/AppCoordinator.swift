//
//  AppCoordinator.swift
//  TopStories
//
//  Created by Ghulam Nasir on 8/24/18.
//  Copyright © 2018 Ghulam Nasir. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    var window: UIWindow
    
    var navigationController: UINavigationController?
    var childCoordinator: Coordinator?
    
    init(with window: UIWindow) {
        self.window = window
    }
    
    func start() {
        navigationController = storyboard().instantiateInitialViewController() as? UINavigationController
        self.window.rootViewController = navigationController
        
        //TODO: set delegate
        let service = APIService.init(with: ApiConstants.NYTimesApi.Urls.Services)
        let storyListCoordinator = StoriesListCoordinator(with: navigationController, service: service)
        
        self.childCoordinator = storyListCoordinator
        storyListCoordinator.start()
    }
    
    deinit {
        navigationController = nil
        childCoordinator = nil
    }
}
