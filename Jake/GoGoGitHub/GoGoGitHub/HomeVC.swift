//
//  HomeVC.swift
//  GoGoGitHub
//
//  Created by Jacob Dobson on 11/1/16.
//  Copyright © 2016 Jacob Dobson. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    var allRepositories = [String]()
    
    @IBOutlet weak var repoSearchBar: UISearchBar!
    @IBOutlet weak var repoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.repoTableView.delegate = self
        self.repoTableView.dataSource = self
        self.repoSearchBar.delegate = self
        
        update()
    }
    
    func update() {
        GitHubService.shared.fetchRepos { (repositories) in
            
            if let repositories = repositories {
                GitHubService.shared.allRepos = repositories
            }
            self.repoTableView.reloadData()
        }
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RepoTableViewCell.id , for: indexPath) as? RepoTableViewCell
        
        var currentRepository: Repository
        
        if repoSearchBar.text == "" {
            currentRepository = GitHubService.shared.allRepos[indexPath.row]
        } else {
            currentRepository = GitHubService.shared.filteredRepos[indexPath.row]
        }
        cell?.textLabel?.text = currentRepository.name
        cell?.detailTextLabel?.text = currentRepository.description
    
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if repoSearchBar.text == "" {
            return GitHubService.shared.allRepos.count
        } else {
            return GitHubService.shared.filteredRepos.count
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let filteredRepos = GitHubService.shared.allRepos.filter({$0.name.contains(searchText)})
        GitHubService.shared.filteredRepos = filteredRepos
        self.repoTableView.reloadData()
    }
}
