//
//  AuthVC.swift
//  GoGoGitHub
//
//  Created by Jacob Dobson on 11/1/16.
//  Copyright © 2016 Jacob Dobson. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {
    
    let parameters = ["scope": "user:email,repo"]
    
    //ACTION(S)
    @IBAction func loginButtonPressed(_ sender: Any) {
        GitHubService.shared.oAuthWith(parameters: parameters)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func dismissAuthController() {
        self.view.removeFromSuperview()
        self.removeFromParentViewController()
    }
}
