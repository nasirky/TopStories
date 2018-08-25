//
//  StoryListViewModel.swift
//  TopStories
//
//  Created by Ghulam Nasir on 8/24/18.
//  Copyright © 2018 Ghulam Nasir. All rights reserved.
//

import UIKit

class StoryListViewModel {
    private var storiesList: StoriesList
    private var service: Service?
    
    var coordinatorDelegate: StoriesListViewModelCoordinatorDelegate?

    init(with list: StoriesList, _ service: Service? = nil) {
        self.storiesList = list
        self.service = service
    }
    
    /// Returns ItemViewModel array for the ListViewModel. Fetches new list from the API in case the current one has expired or it has no items.
    public func fetch(onCompletion completionHandler: @escaping ((_ error: String?)->Void)) {
        
        guard let service = service else {
            completionHandler(Constants.ErrorMessages.NoServiceAttached)
            return
        }
        
        TopStoriesTask().execute(in: service, onSuccess: { list in
            self.storiesList = list
            completionHandler(nil)
        }) { error in
            completionHandler(error)
        }
    }
}

extension StoryListViewModel {
    var numberOfItems: Int {
        return storiesList.items.count
    }
    
    func itemAtIndex(_ index: Int) -> StoryItem? {
        return storiesList.items[index]
    }
    
    func useItemAtIndex(_ index: Int) {
        if let coordinatorDelegate = coordinatorDelegate, index < storiesList.items.count {
            coordinatorDelegate.didSelectItem(storiesList.items[index])
        }
    }
}
