//
//  Constants.swift
//  TopStories
//
//  Created by Ghulam Nasir on 8/24/18.
//  Copyright © 2018 Ghulam Nasir. All rights reserved.
//

import Foundation
struct Constants {
    struct Identifiers {
        struct Media {
            static let thumbnailImage = "thumbLarge"
            static let image = "mediumThreeByTwo210"
        }
        
        struct Cells {
            static let TopStoryCell = "topStoryCell"
        }
        
        struct ViewControllers {
            static let StoriesListViewController = "storiesListVC"
            static let StoryDetailViewController = "storyDetailVC"
        }
    }
    
    struct ErrorMessages {
        static let NoServiceAttached = "No Service attached"
        static let TopStoryCellNotFound = "Expecting a topStoryCell"
        static let InvalidUrl = "Sorry, the provided url is invalid"
        static let UnableToOpenUrl = "Sorry, the url cannot be opened"
    }
    
    struct DefaultValues {
        static let General = "General"
    }
}
