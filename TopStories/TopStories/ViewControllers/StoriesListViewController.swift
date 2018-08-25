//
//  ListViewController.swift
//  TopStories
//
//  Created by Ghulam Nasir.
//  Copyright © 2018 Ghulam Nasir. All rights reserved.
//

import UIKit

class StoriesListViewController: UIViewController {
    
    @IBOutlet weak var tvTopStories: UITableView!
    var refreshControl: UIRefreshControl!

    var storiesListViewModel: StoryListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(StoriesListViewController.loadStories), for: UIControlEvents.valueChanged)
        tvTopStories.refreshControl = refreshControl
        
        refreshControl.beginRefreshing()
        loadStories()
    }

    @objc func loadStories() {
        storiesListViewModel.fetch { [unowned self] error in
            self.refreshControl.endRefreshing()
            if let error = error {
                self.showAlert(message: error)
                return
            }
            
            self.tvTopStories.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension StoriesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storiesListViewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.Cells.TopStoryCell) as? TopStoryCell else {
            fatalError(Constants.ErrorMessages.TopStoryCellNotFound)
        }
        
        if let storyItem = storiesListViewModel.itemAtIndex(indexPath.row) {
            cell.storyItemViewModel = StoryItemViewModel(with: storyItem)
        }
        
        return cell
    }
}

extension StoriesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        storiesListViewModel.useItemAtIndex(indexPath.row)
    }
}
