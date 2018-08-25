//
//  StoryItemViewModel.swift
//  TopStories
//
//  Created by Ghulam Nasir on 8/24/18.
//  Copyright © 2018 Ghulam Nasir. All rights reserved.
//

import Foundation
public class StoryItemViewModel {
    internal var storyItem: StoryItem!
    
    //MARK:- Initializers
    /// Returns a newly initialized `StoryItemViewModel` object, initialized with the `StoryItem` model/object.
    /// - Parameters:
    ///   - storyItem: `StoryItem` object
    init(with storyItem: StoryItem) {
        self.storyItem = storyItem
    }

    public var title: String {
        return storyItem.title
    }
    
    public var author: String {
        return storyItem.author
    }
    
    public var thumbnailUrl: URL? {
        return getUrl(from: storyItem.media, for: Constants.Identifiers.Media.thumbnailImage)
    }
    
    internal func getUrl(from media: [Media], for format: String) -> URL? {
        let mediaItems = storyItem.media.filter { media in
            return media.format == format
        }
        guard let mediaItem = mediaItems.first else {
            return nil
        }
        
        return URL(string: mediaItem.url)
    }    
}
