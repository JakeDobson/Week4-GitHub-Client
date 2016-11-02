//
//  Repository.swift
//  GoGoGitHub
//
//  Created by Jacob Dobson on 11/1/16.
//  Copyright © 2016 Jacob Dobson. All rights reserved.
//

import Foundation

//potentially make into a struct
class Repository {
    
    let name: String
    let description: String?
    let language: String?
    
    init?(json: [String: Any]) {
        if let name = json["name"] as? String {
            self.name = name
            self.description = json["description"] as? String
            self.language = json["language"] as? String
        } else {
            return nil
        }
    }
}
