//
//  ProfileEditViewController.swift
//  app-tem-convenio-cwi
//
//  Created by Marielle Wronka on 04/07/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

class ProfileEditViewController: BaseImagePickerViewController {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var professionTextField: UITextField!
    @IBOutlet weak var birthTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var aboutTextView: UITextView!
    
    private let presenter = ProfileEditPresenter()
    
    var date = Date() {
        didSet {
            //self.birthTextField.text = self.date.toString()
        }
    }

    @IBAction func touchDismiss(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func touchSaveUser(_ sender: Any) {
        self.presenter.saveUser(withUID: (Session.instance.loggedUser?.uid)!,
                                withName: usernameTextField.text,
                                withEmail: emailTextField.text,
                                withProfession: professionTextField.text,
                                withBirth: birthTextField.text?.toDate(),
                                withPhone: phoneTextField.text,
                                withAbout: aboutTextView.text,
                                withImageURL: "")
        //dismiss(animated: true)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addKeyboardObservers()
        self.presenter.view = self
        self.baseImagePickerCallback = self
        //self.addGestureToImageView(imageView: self.imageButton)
        presenter.fetchData()
        aboutTextView.placeholder = "Resumo do Usuário"
    }
    
    func onFieldsInvalid(error: ValidationError) {
        let alert = UIAlertController(title: error.title, message: error.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default))
        self.present(alert, animated: true, completion: nil)
    }

}

extension ProfileEditViewController: ProfileEditViewType {
    
    func onProfileSucess() {
        
    }
    
    func onImageSelected(image: UIImage) {
        self.userImageView.image = image
    }
    
    func onProfileSaved() {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func onFailure(error: BaseError) {
        self.showFailureAlert(withError: error)
    }
    
    
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
        aboutTextView.text = user?.about
        
    }
    
}

extension ProfileEditViewController: BaseImagePickerProtocol {
    
    func onFailure() {
        self.showFailureAlert(withError: ImagePickerError.failure)
    }
    
    func onImageLoaded(image: UIImage) {
        self.presenter.image = image
    }
    
    
}
