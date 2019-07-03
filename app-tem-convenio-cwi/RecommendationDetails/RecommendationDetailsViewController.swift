//
//  RecommendationDetailsViewController.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 30/06/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

class RecommendationDetailsViewController: BaseImagePickerViewController {

    @IBOutlet weak var imageButton: UIImageView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var aboutField: UITextView!
    
    @IBOutlet var categoryButtonsCollection: [UIButton]!
    
    @IBAction func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectCategory(_ sender: UIButton) {
        self.presenter.selectedCategory = sender.tag
    }
    
    @IBAction func saveRecommendation(_ sender: UIButton) {
        self.presenter.saveRecommendation(withImage: self.recommendation?.image,
                                          withName: self.nameField.text,
                                          withPhone: self.phoneField.text,
                                          withEmail: self.emailField.text,
                                          withAddress: self.locationField.text,
                                          withAbout: self.aboutField.text
        )
    }
    
    var recommendation: Recommendation?
    private let presenter = RecommendationDetailsPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.addKeyboardObservers()
        self.presenter.view = self
        self.baseImagePickerCallback = self
        self.addGestureToImageView(imageView: self.imageButton)
        self.loadRecommendation()
    }
    
    private func loadRecommendation() {
        if let recommendation = self.recommendation {
            self.nameField.text = recommendation.name
            if let imageURL = recommendation.image {
                self.imageButton.loadImage(from: imageURL)
            }
            if let category = recommendation.category {
                self.presenter.selectedCategory = category.tag
            }
        }
    }

}

extension RecommendationDetailsViewController: RecommentationDetailsViewType {
    
    func onCategorySelected(categoryTag: Int) {
        let category = Category(tag: categoryTag)
        self.categoryButtonsCollection.forEach { (button) in
            if button.tag == categoryTag {
                button.backgroundColor = category.primaryColor
            } else {
                button.backgroundColor = UIColor(named: "disable")
            }
        }
    }
    
    func onRecommendationSaved() {
        DispatchQueue.main.async {
            self.goBack()
        }
    }
}

extension RecommendationDetailsViewController: BaseImagePickerProtocol {
    
    func onFailure() {
        //todo: handle failure
    }
    
    func onImageLoaded(image: UIImage) {
        self.imageButton.image = image
    }
    
    
}
