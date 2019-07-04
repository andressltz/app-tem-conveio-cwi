//
//  ProfileViewController.swift
//  app-tem-convenio-cwi
//
//  Created by Marielle Wronka on 03/07/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var professionLabel: UILabel!
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    
    private let presenter = ProfilePresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.view = self
        presenter.fetchData()
    }
    
    func onFieldsInvalid(error: ValidationError) {
        let alert = UIAlertController(title: error.title, message: error.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension ProfileViewController: ProfileViewType {
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
        
        usernameLabel.text = user?.name
        birthLabel.text = user?.birthday?.toString()
        professionLabel.text = user?.profession
        phoneLabel.text = user?.phone
        emailLabel.text = user?.email
        aboutLabel.text = user?.about
        
    }
}
