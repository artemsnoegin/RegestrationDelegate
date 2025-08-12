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
        
        let navigationController = UINavigationController(rootViewController: ProfileViewController())
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}

