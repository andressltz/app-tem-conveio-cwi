//
//  EstablishmentRecommendationViewController.swift
//  app-tem-convenio-cwi
//
//  Created by Ândres Schultz on 04/07/19.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

class EstablishmentRecommendationViewController: BaseImagePickerViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var establishmentImageView: UIImageView!
    
    @IBOutlet var categoryButtonColection: [UIButton]!
    
    private let presenter = EstablishmentRecommendationPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addKeyboardObservers()
        self.presenter.view = self
        self.baseImagePickerCallback = self
        self.addGestureToImageView(imageView: self.establishmentImageView)
    }
    
    @IBAction func categoryClick(_ sender: UIButton) {
        self.presenter.selectedCategory = sender.tag
    }
    
    @IBAction func backgroundClick(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func recommendClickButton(_ sender: Any) {
        self.presenter.saveRecommendation(withImage: "", withName: nameTextField.text, withCategory: nil)
    }
}

extension EstablishmentRecommendationViewController: EstablishmentRecommendationViewType {
    
    func onCategorySelected(categoryTag: Int) {
        let category = Category(tag: categoryTag)
        self.categoryButtonColection.forEach { (button) in
            if button.tag == categoryTag {
                button.backgroundColor = category.primaryColor
            } else {
                button.backgroundColor = UIColor(named: "disable")
            }
        }
    }
    
    func onRecommendationSaved() {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func onImageSelected(image: UIImage) {
        self.establishmentImageView.image = image
    }
    
    func onFailure(error: BaseError) {
        self.showFailureAlert(withError: error)
    }
    
}

extension EstablishmentRecommendationViewController: BaseImagePickerProtocol {
    
    func onFailure() {
        self.showFailureAlert(withError: ImagePickerError.failure)
    }
    
    func onImageLoaded(image: UIImage) {
        self.presenter.image = image
    }
    
}
