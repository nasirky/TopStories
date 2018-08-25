//
//  StoryDetailViewModel.swift
//  TopStories
//
//  Created by Ghulam Nasir on 8/25/18.
//  Copyright © 2018 Ghulam Nasir. All rights reserved.
//

import Foundation
public class StoryDetailViewModel: StoryItemViewModel {
    var coordinatorDelegate: StoryDetailViewModelCoordinatorDelegate?
    
    public var viewTitle: String {
        guard storyItem.subsection.trimmingCharacters(in: .whitespacesAndNewlines).count > 0 else {
            return Constants.DefaultValues.General
        }
        return storyItem.subsection
    }
    
    public var description: String {
        return storyItem.description
    }
    
    public var url: URL? {
        return URL(string: storyItem.url)
    }
    
    public var imageUrl: URL? {
        return getUrl(from: storyItem.media, for: Constants.Identifiers.Media.image)
    }
    
    public func done() {
        coordinatorDelegate?.detailViewModelDidEnd(self)
    }
}
