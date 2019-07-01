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
    
    @IBOutlet weak var emailTextField: DesignableTextField!
    @IBOutlet weak var passwordTextField: DesignablePasswordTextField!
    
    @IBOutlet weak var passwordViewButton: UIButton!
    
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
        self.performSegue(withIdentifier: "MainSegue", sender: nil)
    }
    
}
