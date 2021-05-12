//
//  LoginPresenter.swift
//  jonathan-teste-sonda
//
//  Created by Jonathan Alajoan Rocha on 12/05/21.
//

import Foundation
import UIKit
protocol LoginUserPresenterDelegate: AnyObject{
    func presentLogin(success: Bool)
}

typealias LoginPresenterDelegate = LoginUserPresenterDelegate & UIViewController

class LoginPresenter {
    
    weak var delegate: LoginPresenterDelegate?
    var loginMockup: String = "sonda"
    var passwordMockup: String = "123456"
    
    public func setViewDelegate(delegate: LoginPresenterDelegate) {
        self.delegate = delegate
    }
    
    public func login(login: String, password: String) {
        
        if(login == loginMockup && password == passwordMockup) {
            
            self.delegate?.presentLogin(success: true)
        } else {
            
            self.delegate?.presentLogin(success: false)
        }
    }
}
