//
//  RegisterViewController.swift
//  app-tem-convenio-cwi
//
//  Created by Marielle Wronka on 30/06/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
  
    var clickViewPassword = false
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
    
    @IBAction func touchDsmiss(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func registerTouchUpInside(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
