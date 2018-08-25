//
//  StoryDetailCoordinator.swift
//  TopStories
//
//  Created by Ghulam Nasir on 8/24/18.
//  Copyright © 2018 Ghulam Nasir. All rights reserved.
//

import UIKit
public class StoryDetailCoordinator: Coordinator {
    var navigationController: UINavigationController?
    var storyDetailViewController: StoryDetailViewController!
    var storyItem: StoryItem

    weak var delegate: StoryDetailCoordinatorDelegate?
    
    init(with navigationController: UINavigationController?, storyItem item: StoryItem) {
        self.navigationController = navigationController
        self.storyItem = item
    }
    
    func start() {
        storyDetailViewController = storyboard().instantiateViewController(withIdentifier: Constants.Identifiers.ViewControllers.StoryDetailViewController) as! StoryDetailViewController

        let storyDetailViewModel = StoryDetailViewModel(with: storyItem)
        storyDetailViewModel.coordinatorDelegate = self
        storyDetailViewController.storyDetailViewModel = storyDetailViewModel

        self.navigationController?.pushViewController(storyDetailViewController, animated: true)
    }
}

extension StoryDetailCoordinator: StoryDetailViewModelCoordinatorDelegate {
    public func detailViewModelDidEnd(_ viewModel: StoryDetailViewModel) {
        delegate?.detailCoordinatorDidFinish(detailCoordinator: self)
    }
    

}

