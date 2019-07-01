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
    
    @IBOutlet weak var nameTextField: DesignableTextField!
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
    
    @IBAction func touchDsmiss(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func registerTouchUpInside(_ sender: UIButton) {
        
        let name: String
        name = nameTextField.text!
        
        let email: String
        email = emailTextField.text!
        
        let password: String
        password = passwordTextField.text!
        
        if email.isEmpty || password.isEmpty || name.isEmpty {
            let alert = UIAlertController(title: "Oops!", message: "É necessário preencher todos os campos.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default))
            self.present(alert, animated: true, completion: nil)
        } else if !email.contains("@cwi.com.br") {
            let alert = UIAlertController(title: "E-mail Inválido!", message: "O e-mail precisa ser do domínio da CWI.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default))
            self.present(alert, animated: true, completion: nil)
        } else {
            // TODO: Conectar com Firebase
            self.performSegue(withIdentifier: "MainSegue", sender: nil)
        }    }
    
}
