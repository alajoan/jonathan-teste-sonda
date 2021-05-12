//
//  UIStoryboardsExtension.swift
//  jonathan-teste-sonda
//
//  Created by Jonathan Alajoan Rocha on 11/05/21.
//

import Foundation
import UIKit

extension UIStoryboard {
    static func buildMoreViewController() -> UIViewController {
        return loginStoryboard.instantiateViewController(withIdentifier: "More")
    }
    
    static func buildLoginViewController() -> UIViewController {
        return loginStoryboard.instantiateViewController(withIdentifier: "Login")
    }
    
    static func buildMainViewController() -> UIViewController {
        return mainStoryboard.instantiateViewController(withIdentifier: "Main")
    }
}

extension UIStoryboard {
    static var moreStoryboard : UIStoryboard {
        return getStoryboard(name: "More")
    }
    
    static var loginStoryboard : UIStoryboard {
        return getStoryboard(name: "Login")
    }
    
    static var mainStoryboard : UIStoryboard {
        return getStoryboard(name: "Main")
    }
}

extension UIStoryboard {
    static func getStoryboard(name: String) -> UIStoryboard {
        return UIStoryboard(name: name, bundle: nil)
    }
}
