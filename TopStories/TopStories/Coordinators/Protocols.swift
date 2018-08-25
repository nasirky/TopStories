//
//  Protocols.swift
//  TopStories
//
//  Created by Ghulam Nasir on 8/24/18.
//  Copyright © 2018 Ghulam Nasir. All rights reserved.
//

import Foundation
public protocol StoryListCoordinatorDelegate: class {
    func listCoordinatorDidFinish(listCoordinator: StoriesListCoordinator)
}

public protocol StoriesListViewModelCoordinatorDelegate: class {
    func didSelectItem(_ storyItem: StoryItem)
}

public protocol StoryDetailViewModelCoordinatorDelegate: class {
    func detailViewModelDidEnd(_ viewModel: StoryDetailViewModel)
}

public protocol StoryDetailCoordinatorDelegate: class {
    func detailCoordinatorDidFinish(detailCoordinator: StoryDetailCoordinator)
}
