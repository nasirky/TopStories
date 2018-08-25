//
//  TopStoryCell.swift
//  TopStories
//
//  Created by Ghulam Nasir on 8/24/18.
//  Copyright © 2018 Ghulam Nasir. All rights reserved.
//

import UIKit
import SDWebImage

class TopStoryCell: UITableViewCell {
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!

    var storyItemViewModel: StoryItemViewModel? {
        didSet {
            configureCell()
        }
    }

    func configureCell() {
        lblTitle.text = storyItemViewModel?.title
        lblAuthor.text = storyItemViewModel?.author
        
        ivImage.sd_setShowActivityIndicatorView(true)
        ivImage.sd_setIndicatorStyle(.gray)
        ivImage.sd_setImage(with: storyItemViewModel?.thumbnailUrl, completed: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
