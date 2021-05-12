//
//  SceneDelegate.swift
//  jonathan-teste-sonda
//
//  Created by Jonathan Alajoan Rocha on 11/05/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

   var window: UIWindow?
   let storyboard = UIStoryboard(name: "Login", bundle: nil)

   func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
      guard let windowScene = scene as? UIWindowScene else { return }
      let vc = storyboard.instantiateViewController (withIdentifier: "Login") as! LoginViewController
      window = UIWindow(windowScene: windowScene)
      window?.rootViewController = vc
      window?.makeKeyAndVisible()
   }
}
