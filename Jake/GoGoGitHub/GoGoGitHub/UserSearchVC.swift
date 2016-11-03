//
//  UserSearchVC.swift
//  GoGoGitHub
//
//  Created by Jacob Dobson on 11/3/16.
//  Copyright © 2016 Jacob Dobson. All rights reserved.
//

import UIKit
import WebKit
import SafariServices

class UserSearchVC: UIViewController {

    //outlets
    @IBOutlet weak var userSearchTableView: UITableView!
    @IBOutlet weak var userSearchBar: UISearchBar!
    
    //computed variable
    var searchedUsers = [User]() {
        didSet { userSearchTableView.reloadData() }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userSearchTableView.dataSource = self
        self.userSearchTableView.delegate = self
        self.userSearchBar.delegate = self
    }
}


extension UserSearchVC: UITableViewDataSource, UITableViewDelegate {
    
    //dataSource methods
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userSearchTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let currentUser = self.searchedUsers[indexPath.row]
        
        cell.textLabel?.text = currentUser.login
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchedUsers.count
    }
    
    //delegate methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedUser = self.searchedUsers[indexPath.row]
        
        presentWebControllerWith(url: selectedUser.webURL)
        //presentSafariViewControllerWith(url: selectedUser.webURL)
    }
    
    func presentWebControllerWith(url: String) {
        let webVC = WebVC()
        
        webVC.webURL = url
        
        self.present(webVC, animated: true, completion: nil)
        
    }
    
    func presentSafariViewControllerWith(url: String) {
        let safariVC = SFSafariViewController(url: URL(string: url)!)
        
        self.present(safariVC, animated: true, completion: nil)
    }
}

extension UserSearchVC: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            
            GitHubService.shared.searchUsersWith(searchTerm: searchText, completion: { (results) in
                if let results = results {
                    self.searchedUsers = results
                }
            })
        }
        self.userSearchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isValid {
            let lastIndex = searchText.index(before: searchText.endIndex)
            searchBar.text = searchText.substring(to: lastIndex)
            searchBar.search
        }
    }
}





