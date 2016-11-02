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
    let createdAt: String
    let issuesCount: Int?
    
    init?(json: [String: Any]) {
        if let name = json["name"] as? String, let createdAt = json["created_at"] as? String {
            self.name = name
            self.createdAt = createdAt
            self.description = json["description"] as? String
            self.language = json["language"] as? String
            self.issuesCount = json["open_issues_count"] as? Int
        } else {
            return nil
        }
    }
}
