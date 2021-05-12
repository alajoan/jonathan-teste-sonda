//
//  LoginViewController.swift
//  jonathan-teste-sonda
//
//  Created by Jonathan Alajoan Rocha on 11/05/21.
//

import UIKit

class LoginViewController: LoginPresenterDelegate, UITextFieldDelegate {
    
    var success: Bool = false
    
    
    private let presenter = LoginPresenter()
    
    @IBOutlet weak var loginTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTextfield.delegate = self
        passwordTextfield.delegate = self
        presenter.setViewDelegate(delegate: self)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if(textField.text != "") {
            return true
        } else {
            textField.placeholder = "Preencha o campo antes do login"
            return false
        }
    }
    
    @IBAction func login(_ sender: UIButton) {
        
        LoadingStatus.showUniversalLoadingView(true,loadingText: "Logando...")
        presenter.login(login: loginTextfield.text!, password: passwordTextfield.text!)
    }
    
    func presentLogin(success: Bool) {
        if(success == true) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                LoadingStatus.showUniversalLoadingView(false)
                self.present(UIStoryboard.buildMainViewController(), animated: true, completion: nil)
            }
        } else {
            LoadingStatus.showUniversalLoadingView(false)
            let alert = UIAlertController(title: "Login falhou!", message: "Login ou senha incorretos.", preferredStyle: UIAlertController.Style.alert)

                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))

                    // show the alert
                    self.present(alert, animated: true, completion: nil)
        }
    }
    
    

}
