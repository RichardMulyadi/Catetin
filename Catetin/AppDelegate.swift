//
//  AppDelegate.swift
//  Catetin
//
//  Created by Richard Mulyadi
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
//        UINavigationBar.appearance().barTintColor = UIColor(red: 155.0/255.0, green: 89.0/255.0, blue: 182.0/255.0, alpha: 1.0)
//        UINavigationBar.appearance().tintColor = UIColor.white
//
//        let color = UIColor.white
//        let font = UIFont(name: "Helvetica", size: 20)!
//        let attributes: [String: AnyObject] =  [
//            NSFontAttributeName: font,
//            NSForegroundColorAttributeName: color
//        ]
//
//        UINavigationBar.appearance().titleTextAttributes = attributes
//
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

