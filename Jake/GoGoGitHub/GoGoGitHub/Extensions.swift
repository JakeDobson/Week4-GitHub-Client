//
//  Extensions.swift
//  GoGoGitHub
//
//  Created by Jacob Dobson on 10/31/16.
//  Copyright © 2016 Jacob Dobson. All rights reserved.
//

import UIKit


let userDefaultAccessTokenKey = "access_token"

//everything you need for identifier EX: --> "tweetCell.id"
extension UIResponder {
    static var id: String {
        return String(describing: self)
    }
}


extension UserDefaults {
    
    func getAccessToken() -> String? {
        return self.string(forKey: userDefaultAccessTokenKey)
    }
    
    func save(accessToken: String) -> Bool {
        self.set(accessToken, forKey: userDefaultAccessTokenKey) // use on print token button
        
        return synchronize() // force it to save right away
    }
}
