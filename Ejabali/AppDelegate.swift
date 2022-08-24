//
//  AppDelegate.swift
//  Ejabali
//
//  Created by Thapliyal, Abhilasha on 31/07/22.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        var rootVC: UIViewController?
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController?.dismiss(animated: true, completion: nil)
        let signInVC: LaunchViewController = UIStoryboard(.launch).instantiateViewController()
        let tempVC = UINavigationController()
        tempVC.setViewControllers([signInVC], animated: false)

        rootVC = tempVC
        rootVC?.view.alpha = 0.8
        self.window?.rootViewController = rootVC

        UIView.transition(with: window!, duration: 0.3, options: .transitionCrossDissolve, animations: {
            rootVC?.view.alpha = 1.0
        }, completion: { _ in
            let defaults = UserDefaults.standard
            defaults.set("Default", forKey: "userType")
            // maybe do something here
        })
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

