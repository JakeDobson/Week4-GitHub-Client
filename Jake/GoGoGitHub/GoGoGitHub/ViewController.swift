//
//  ViewController.swift
//  GoGoGitHub
//
//  Created by Jacob Dobson on 10/31/16.
//  Copyright © 2016 Jacob Dobson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let parameters = ["scope" : "email,user,repo"]    

    @IBAction func requestTokenPressed(_ sender: Any) {
        
        if GitHubService.shared.doesValidTokenExist() == nil {
            GitHubService.shared.oAuthWith(parameters: self.parameters)
        }
    }
    
    @IBAction func printTokenPressed(_ sender: Any) {
        if let token = GitHubService.shared.doesValidTokenExist() {
            print("PRINTING ACCESS TOKEN --> \(token)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

