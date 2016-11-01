//
//  AppDelegate.swift
//  GoGoGitHub
//
//  Created by Jacob Dobson on 10/31/16.
//  Copyright © 2016 Jacob Dobson. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        if GitHubService.shared.doesValidTokenExist() == nil {
            GitHubService.shared.oAuthWith(parameters: ViewController().parameters)
        }
        
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        print(url) // see where the user came from
        
        GitHubService.shared.tokenRequestFor(url: url, options: .userDefaults, completion: { (success) in
            
        })
            
            return true
    }
}
    
    
    
    
    //let code = try? GitHubService.shared.codeFrom(url: url)
    
//    do {
//    let code = try GitHubService.shared.codeFrom(url: url)
//    print(code)
//    } catch {
//    print(error)
//}
