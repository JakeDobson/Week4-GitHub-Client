//
//  WebVC.swift
//  GoGoGitHub
//
//  Created by Jacob Dobson on 11/3/16.
//  Copyright © 2016 Jacob Dobson. All rights reserved.
//

import UIKit
import WebKit

class WebVC: UIViewController {
    
    //variables & constants
    let webView = WKWebView()
    var webURL: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.frame = self.view.frame //making the whole screen of the VC
        self.view.addSubview(webView)
        
        if let url = URL(string: webURL) {
            let request = URLRequest(url: url)
            
            self.webView.load(request) //load the request
        }
    }
}
