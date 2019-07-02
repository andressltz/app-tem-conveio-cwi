//
//  LoginViewController.swift
//  app-tem-convenio-cwi
//
//  Created by Marielle Wronka on 28/06/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var clickViewPassword = false
    private let presenter = LoginPresenter()
    
    @IBOutlet weak var emailTextField: DesignableTextField!
    @IBOutlet weak var passwordTextField: DesignablePasswordTextField!
    
    @IBOutlet weak var passwordViewButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.view = self
    }
    
    @IBAction func clickViewPassword(_ sender: UIButton) {
        if (!clickViewPassword) {
            passwordTextField.isSecureTextEntry = false
            passwordViewButton.setImage(UIImage(named: "ic_password_show"), for: .normal)
        } else {
            passwordTextField.isSecureTextEntry = true
            passwordViewButton.setImage(UIImage(named: "ic_password_hide"), for: .normal)
        }
        clickViewPassword = !clickViewPassword
    }
    
    
    @IBAction func sighInButton(_ sender: UIButton) {
        
        guard let email = emailTextField.text, email.contains("@cwi.com.br") else {
        onFieldsInvalid(error: .invalidEmail)
        return
        }
        
        guard let password = passwordTextField.text, password.count >= 6 else {
            onFieldsInvalid(error: .invalidPassword)
            return
        }
        
        self.presenter.login(withEmail: email, withPassword: password)
    }
    
    func onFieldsInvalid(error: ValidationError) {
        let alert = UIAlertController(title: error.title, message: error.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension LoginViewController: LoginViewType {
    
    func onLoginSucess() {
        self.performSegue(withIdentifier: "MainSegue", sender: nil)
    }
    
    func onFailure(error: APIError) {
        self.showFailureAlert(withError: error)
    }
    
}
