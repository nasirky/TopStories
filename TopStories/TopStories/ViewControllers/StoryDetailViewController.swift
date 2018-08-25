//
//  DetailViewController.swift
//  TopStories
//
//  Created by Ghulam Nasir.
//  Copyright © 2018 Ghulam Nasir. All rights reserved.
//

import UIKit

class StoryDetailViewController: UIViewController {
    var storyDetailViewModel : StoryDetailViewModel!

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!

    @IBOutlet weak var ivImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    func configureView() {
        self.title = storyDetailViewModel.viewTitle
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "Back", style: .done, target: self, action: #selector(StoryDetailViewController.done))
        lblTitle.text = storyDetailViewModel.title
        lblAuthor.text = storyDetailViewModel.author
        lblDescription.text = storyDetailViewModel.description

        ivImage.sd_setShowActivityIndicatorView(true)
        ivImage.sd_setIndicatorStyle(.gray)
        ivImage.sd_setImage(with: storyDetailViewModel.imageUrl, placeholderImage: nil, options: .progressiveDownload, completed: nil)
    }

    @IBAction func seeMore(_ sender: Any) {
        guard let url = storyDetailViewModel.url, UIApplication.shared.canOpenURL(url) else {
            self.showAlert(message: Constants.ErrorMessages.InvalidUrl)
            return
        }
        
        UIApplication.shared.open(url, options: [String: Any](), completionHandler: nil)
    }

    @objc func done() {
        storyDetailViewModel.done()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
