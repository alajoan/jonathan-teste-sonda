//
//  AppDelegate.swift
//  jonathan-teste-sonda
//
//  Created by Jonathan Alajoan Rocha on 11/05/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = UIStoryboard.buildLoginViewController()
        window!.makeKeyAndVisible()
    }
    
}

