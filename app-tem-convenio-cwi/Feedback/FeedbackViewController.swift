//
//  FeedbackViewController.swift
//  app-tem-convenio-cwi
//
//  Created by Marielle Wronka on 05/07/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

class FeedbackViewController: UIViewController {

    @IBOutlet weak var establishmentImageView: DesignableImageView!
    @IBOutlet weak var titleTextField: DesignableTextField!
    @IBOutlet weak var commentTextView: DesignableTextView!
    
    @IBOutlet var starsButtons: [UIButton]!
    @IBOutlet weak var sendButton: UIButton!
    
    var rate_stars: Int = 0
    var establishment: Establishment?
    
    private let presenter = FeedbackPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addKeyboardObservers()
        commentTextView.placeholder = "Comentário"
        loadEstablishment()
        self.presenter.view = self
    }
    
    private func loadEstablishment() {
        if let establishment = self.establishment {
            if let imageURL = establishment.image {
                self.establishmentImageView.loadImage(from: imageURL)
            }
        }
    }
    
    @IBAction func touchDsmiss(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        for button in starsButtons {
            if button.tag <= sender.tag {
                rate_stars = button.tag
                button.setImage(UIImage.init(named: "ic_star_enable"), for: .normal)
            } else {
                rate_stars = button.tag
                button.setImage(UIImage.init(named: "ic_star_disable"), for: .normal)
            }
        }
    }
    
    @IBAction func saveFeedback(_ sender: Any) {
        self.sendButton.isDisableButton()
        self.presenter.sendFeedback(withTitle: titleTextField.text,
                                    withRate: rate_stars,
                                    withComment: commentTextView.text,
                                    withDate: Date())
    }
    
    
}

extension FeedbackViewController: FeedbackViewType {
    
    func onFeedbackSended() {
        dismiss(animated: true)
    }
    
    func onFailure(error: BaseError) {
        self.sendButton.isEnabledButton()
        self.showFailureAlert(withError: error)
    }
    
}
