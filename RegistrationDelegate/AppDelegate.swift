//
//  AppDelegate.swift
//  RegistrationDelegate
//
//  Created by Артём Сноегин on 11.08.2025.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let delegateNavigationController = UINavigationController(rootViewController: ProfileViewController())
        delegateNavigationController.tabBarItem = UITabBarItem(title: "Delegate", image: UIImage(systemName: "paperplane"), selectedImage: UIImage(systemName:"paperplane.fill"))
        
        let completionNavigationController = UINavigationController(rootViewController: ProfileViewController2())
        completionNavigationController.tabBarItem = UITabBarItem(title: "Completion", image: UIImage(systemName: "link"), selectedImage: UIImage(systemName:"link"))
        
        let tabBar = UITabBarController()
        tabBar.viewControllers = [delegateNavigationController, completionNavigationController]
        
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
        return true
    }
}

