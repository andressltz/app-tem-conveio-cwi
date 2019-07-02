//
//  RecommendationDetailsViewController.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 30/06/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

class RecommendationDetailsViewController: UIViewController {

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
        
    }
    
    @IBAction func saveRecommendation(_ sender: UIButton) {
        
        self.presenter.saveRecommendation(with: [:])
    }
    
    var recommendation: Recommendation?
    private let presenter = RecommendationDetailsPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        self.presenter.view = self
        self.loadRecommendation()
    }
    
    private func loadRecommendation() {
        if let recommendation = self.recommendation {
            self.nameField.text = recommendation.name
            if let imageURL = recommendation.image {
                self.imageButton.loadImage(from: imageURL)
            }
        }
    }

}
