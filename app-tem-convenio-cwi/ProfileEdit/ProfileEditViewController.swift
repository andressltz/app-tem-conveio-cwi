//
//  ProfileEditViewController.swift
//  app-tem-convenio-cwi
//
//  Created by Marielle Wronka on 04/07/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

class ProfileEditViewController: UIViewController {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var professionTextField: UITextField!
    @IBOutlet weak var birthTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var aboutTextField: UITextField!
    
    private let presenter = ProfileEditPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.view = self
        self.addKeyboardObservers()
        presenter.fetchData()
    }
    
    func onFieldsInvalid(error: ValidationError) {
        let alert = UIAlertController(title: error.title, message: error.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default))
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func touchDismiss(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func touchSaveUser(_ sender: Any) {
        dismiss(animated: true)
    }
}

extension ProfileEditViewController: ProfileEditViewType {
    
    func loadData(user: User?) {
        
        guard user != nil else {
            onFieldsInvalid(error: .notFoudUser)
            return
        }
        
        DispatchQueue.main.async {
            if let imageURL = user?.imageURL {
                self.userImageView.loadImage(from: imageURL)
            } else {
                self.userImageView.image = .placeholderImage
            }
            
        }
        
        usernameTextField.text = user?.name
        birthTextField.text = user?.birthday?.toString()
        professionTextField.text = user?.profession
        phoneTextField.text = user?.phone
        emailTextField.text = user?.email
        aboutTextField.text = user?.about
        
    }
    
}
