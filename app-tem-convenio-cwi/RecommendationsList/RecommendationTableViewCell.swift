//
//  RecommendationTableViewCell.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 29/06/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

class RecommendationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var recommendedByLabel: UILabel!
    @IBOutlet weak var iconView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!

    func config(with model: Recommendation) {
        DispatchQueue.main.async {
            if let imageURL = model.image {
                self.pictureImageView.loadImage(from: imageURL)
            } else {
                self.pictureImageView.image = .placeholderImage
            }
            self.nameLabel.text = model.name
            self.recommendedByLabel.text = "Indicado por \(model.user.name)"
            self.iconView.backgroundColor = model.category?.primaryColor
            self.iconImageView.image = model.category?.icon
        }
    }

}
