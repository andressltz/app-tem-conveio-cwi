//
//  EstablishmentRecommendationViewController.swift
//  app-tem-convenio-cwi
//
//  Created by Ândres Schultz on 04/07/19.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

class EstablishmentRecommendationViewController: BaseImagePickerViewController {
    
    private let establishment: Establishment? = nil
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var establishmentImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addKeyboardObservers()
//        self.presenter.view = self
//        self.baseImagePickerCallback = self
        self.addGestureToImageView(imageView: self.establishmentImageView)
    }
    
    @IBAction func backgroundClick(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func recommendClickButton(_ sender: Any) {
        // TODO: fazer
        
//        self.presenter.saveUser(withUID: (Session.instance.loggedUser?.uid)!,
//                                withName: usernameTextField.text,
//                                withEmail: emailTextField.text,
//                                withProfession: professionTextField.text,
//                                withBirth: birthTextField.text?.toDate(),
//                                withPhone: phoneTextField.text,
//                                withAbout: aboutTextView.text,
//                                withImageURL: "")
        
        dismiss(animated: true)
    }
}

extension EstablishmentRecommendationViewController { //}: ProfileEditViewType {
    
    func onImageSelected(image: UIImage) {
        self.establishmentImageView.image = image
    }
    
//    func onProfileSaved() {
//        DispatchQueue.main.async {
//            self.dismiss(animated: true, completion: nil)
//        }
//    }
    
//    func onFailure(error: BaseError) {
//        self.showFailureAlert(withError: error)
//    }
}

extension EstablishmentRecommendationViewController: BaseImagePickerProtocol {
    
    func onFailure() {
        self.showFailureAlert(withError: ImagePickerError.failure)
    }
    
    func onImageLoaded(image: UIImage) {
//        self.presenter.image = image
    }
    
    
}
