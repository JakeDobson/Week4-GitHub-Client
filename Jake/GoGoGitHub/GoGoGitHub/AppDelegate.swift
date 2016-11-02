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
    
    var authController: AuthVC?
    var homeController: HomeVC?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        if GitHubService.shared.doesValidTokenExist() == nil {
            GitHubService.shared.oAuthWith(parameters: AuthVC().parameters)
        }
        
        checkAuthStatus()
        
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        print(url) // see where the user came from
        
        //user is redirected back into github
        GitHubService.shared.tokenRequestFor(url: url, options: .userDefaults, completion: { (success) in
            if let authController = self.authController, let _ = self.homeController {
                authController.dismissAuthController()
                //homeController.update()
            }
        })
            
        return true
    }
    
    func checkAuthStatus() {
        if let token = UserDefaults.standard.getAccessToken() {
            print(token)
        } else {
            if let homeViewController = self.window?.rootViewController as? HomeVC, let storyboard = homeViewController.storyboard {
                if let authViewController = storyboard.instantiateViewController(withIdentifier: AuthVC.id) as? AuthVC {
                    
                    homeViewController.addChildViewController(authViewController)
                    
                    homeViewController.view.addSubview(authViewController.view)
                    
                    authViewController.didMove(toParentViewController: homeViewController)
                    
                    //assign memebers we declared
                    self.authController = authViewController
                    self.homeController = homeViewController
                }
            }
        }
    }
}
    
    
    
    
    //let code = try? GitHubService.shared.codeFrom(url: url)
    
//    do {
//    let code = try GitHubService.shared.codeFrom(url: url)
//    print(code)
//    } catch {
//    print(error)
//}
