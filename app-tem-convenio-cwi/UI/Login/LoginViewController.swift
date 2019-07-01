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
        
        let email: String
        email = emailTextField.text!
        
        let password: String
        password = passwordTextField.text!
        
        if email.isEmpty || password.isEmpty {
            let alert = UIAlertController(title: "Oops!", message: "É necessário preencher usuário e senha.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default))
            self.present(alert, animated: true, completion: nil)
        } else if !email.contains("@cwi.com.br") {
            let alert = UIAlertController(title: "E-mail Inválido!", message: "O e-mail precisa ser do domínio da CWI.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default))
            self.present(alert, animated: true, completion: nil)
        } else {
            // TODO: Conectar com Firebase
            self.performSegue(withIdentifier: "MainSegue", sender: nil)
        }
        
    }
    
}
