//
//  Extensions.swift
//  GoGoGitHub
//
//  Created by Jacob Dobson on 10/31/16.
//  Copyright © 2016 Jacob Dobson. All rights reserved.
//

import Foundation


let userDefaultAccessTokenKey = "access_token"

extension UserDefaults {
    
    func getAccessToken() -> String? {
        return self.string(forKey: userDefaultAccessTokenKey)
    }
    
    func save(accessToken: String) -> Bool {
        self.set(accessToken, forKey: userDefaultAccessTokenKey) // use on print token button
        
        return synchronize() // force it to save right away
    }
}
