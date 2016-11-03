//
//  HomeVC.swift
//  GoGoGitHub
//
//  Created by Jacob Dobson on 11/1/16.
//  Copyright © 2016 Jacob Dobson. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    let customTransition = CustomTransition()
    
    var allRepositories = [String]()
    
    @IBOutlet weak var repoSearchBar: UISearchBar!
    @IBOutlet weak var repoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.repoTableView.dataSource = self
        self.repoTableView.delegate = self
        self.repoSearchBar.delegate = self
        
        self.repoTableView.estimatedRowHeight = 100
        self.repoTableView.rowHeight = UITableViewAutomaticDimension
        
        self.repoTableView.register(UINib(nibName: "RepoDetailCell", bundle: nil), forCellReuseIdentifier: RepoTableViewCell.id)
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == RepoDetailVC.id {
            if let destinationController = segue.destination as? RepoDetailVC {
                if let index = repoTableView.indexPathForSelectedRow {
                    destinationController.repo = GitHubService.shared.allRepos[index.row]
                    destinationController.transitioningDelegate = self
                }
            }
        }
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RepoTableViewCell.id , for: indexPath) as? RepoTableViewCell
        
        var currentRepository: Repository
        
        if repoSearchBar.text == "" {
            currentRepository = GitHubService.shared.allRepos[indexPath.row]
        } else {
            currentRepository = GitHubService.shared.filteredRepos[indexPath.row]
        }
         cell?.textLabelOne?.text = currentRepository.name
         cell?.textLabelTwo?.text = currentRepository.description
    
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if repoSearchBar.text == "" {
            return GitHubService.shared.allRepos.count
        } else {
            return GitHubService.shared.filteredRepos.count
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: RepoDetailVC.id, sender: nil)
    }
}

extension HomeVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let text = searchText.lowercased()
        if text != "" {
            let filteredRepos = GitHubService.shared.allRepos.filter({$0.name.lowercased().contains(text)})
            GitHubService.shared.filteredRepos = filteredRepos
        } else {
            self.repoTableView.reloadData()
            searchBar.resignFirstResponder()
        }
    }
}

extension HomeVC: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self.customTransition
    }
}
