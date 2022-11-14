//
//  AppDelegate.swift
//  Examen
//
//  Created by David Lopez on 11/11/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var global_nav_controller: UINavigationController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            
        window = UIWindow()
        let mainVC = LoginViewController()
        global_nav_controller = UINavigationController(rootViewController: mainVC)
        window?.rootViewController = global_nav_controller
        window?.makeKeyAndVisible()
        
        return true
    }
}

