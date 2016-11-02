//
//  RepoDetailViewController.swift
//  GoGoGitHub
//
//  Created by Jacob Dobson on 11/2/16.
//  Copyright © 2016 Jacob Dobson. All rights reserved.
//

import UIKit

class RepoDetailVC: UIViewController {

    //outlets
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var repoDescriptionLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var issuesCountLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    
    var repo: Repository? = nil
    
    //actions
    @IBAction func dismissalButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pushRepoDetails()
    }
    
    func pushRepoDetails() {
        if let repo = repo {
            self.repoNameLabel.text = repo.name
            self.repoDescriptionLabel.text = repo.description
            self.createdAtLabel.text = repo.createdAt
            self.issuesCountLabel.text = String(describing: repo.issuesCount)
            self.languageLabel.text = repo.language
        }
    }
}
