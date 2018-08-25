//
//  StoryListCoordinator.swift
//  TopStories
//
//  Created by Ghulam Nasir on 8/24/18.
//  Copyright © 2018 Ghulam Nasir. All rights reserved.
//

import UIKit

public class StoriesListCoordinator: Coordinator {
    var navigationController: UINavigationController?
    var storiesListViewController: StoriesListViewController!

    var service: APIService
    var storyDetailCoordinator: StoryDetailCoordinator?
    
    init(with navigationController: UINavigationController?, service: APIService) {
        self.navigationController = navigationController
        self.service = service
    }
    
    func start() {
        storiesListViewController = storyboard().instantiateViewController(withIdentifier: Constants.Identifiers.ViewControllers.StoriesListViewController) as! StoriesListViewController
        
        let storyListViewModel = StoryListViewModel(with: StoriesList(), service)
        storyListViewModel.coordinatorDelegate = self
        storiesListViewController.storiesListViewModel = storyListViewModel
        
        self.navigationController?.viewControllers = [storiesListViewController]
    }
}


extension StoriesListCoordinator: StoriesListViewModelCoordinatorDelegate {
    public func didSelectItem(_ storyItem: StoryItem) {
        storyDetailCoordinator = StoryDetailCoordinator.init(with: navigationController, storyItem: storyItem)
        storyDetailCoordinator?.delegate = self

        storyDetailCoordinator?.start()
    }
}

extension StoriesListCoordinator: StoryDetailCoordinatorDelegate {
    public func detailCoordinatorDidFinish(detailCoordinator: StoryDetailCoordinator) {
        self.storyDetailCoordinator = nil
        self.navigationController?.popViewController(animated: true)
    }
}
