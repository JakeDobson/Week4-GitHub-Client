//
//  GitHubService.swift
//  GoGoGitHub
//
//  Created by Jacob Dobson on 10/31/16.
//  Copyright © 2016 Jacob Dobson. All rights reserved.
//

import UIKit


typealias GitHubAuthCompletion = (Bool) -> ()

let kBaseURLString = "https://github.com/login/oauth/"

enum GitHubOAuthError: Error {
    case extractingCode(String)
}

enum SaveOptions {
    case userDefaults
}


class GitHubService {
 
    static let shared = GitHubService() // singleton
    
    private init() {
        
    }
    
    func oAuthWith(parameters: [String: String]) {
        var parameterString = String()
        
        for(key, value) in parameters {
            parameterString += "&\(key)=\(value)"
        }
        if let requestURL = URL(string: "\(kBaseURLString)authorize?client_id=\(kGitHubClientID)\(parameterString)") {
            print(requestURL.absoluteString)
            
            UIApplication.shared.open(requestURL)
        }
    }
    
    func codeFrom(url: URL) throws -> String {
        // must implement do try catch, because of throws
        
        guard let code = url.absoluteString.components(separatedBy: "=").last else {
            throw GitHubOAuthError.extractingCode("Temporary code not found in string, see codeFrom(url:)")
        }
        
        return code
    }
    
    func accessTokenFrom(_ string: String) -> String? {
        if string.contains("access_token") {
            let components = string.components(separatedBy: "&")
            
            for component in components {
                if component.contains("access_token") {
                    let token = component.components(separatedBy: "=").last
                    
                    return token
                }
            }
        }
        return nil
    }
    
    func tokenRequestFor(url: URL, options: SaveOptions, completion: @escaping GitHubAuthCompletion) {
        func returnToMainWith(success: Bool) {
            OperationQueue.main.addOperation { completion(success) }
        }
        do {
            let code = try codeFrom(url: url)
            
            let requestString = "\(kBaseURLString)/access_token?client_id=\(kGitHubClientID)&client_secret=\(kGitHubClientSecret)&code=\(code)"
            
            if let requestURL = URL(string: requestString) {
                let session = URLSession(configuration: .ephemeral)
                
                session.dataTask(with: requestURL, completionHandler: { (data, response, error) in
                    if error != nil { returnToMainWith(success: false) }
                    guard let data = data else { returnToMainWith(success: true); return }
                        if let dataString = String(data: data, encoding: .utf8) {
                            if let token = self.accessTokenFrom(dataString) {
                                print("Access Token: \(token)")
                                let success = UserDefaults.standard.save(accessToken: token)
                                returnToMainWith(success: success)
                        }
                    } else {
                        returnToMainWith(success: false)
                    }
                }).resume()
            }
        } catch {
            returnToMainWith(success: false)
        }
    }
    
    func doesValidTokenExist() -> String? {
        return UserDefaults.standard.getAccessToken()
    }
}


