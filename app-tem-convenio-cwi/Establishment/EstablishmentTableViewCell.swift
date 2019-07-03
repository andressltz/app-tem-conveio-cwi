//
//  EstablishmentTableViewCell.swift
//  app-tem-convenio-cwi
//
//  Created by Ândres Schultz on 30/06/19.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

class EstablishmentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var establishmentName: UILabel!
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var favoriteImageView: UIImageView!
    
    func config(with model: Establishment) {
        if let imageUrl = model.image {
            pictureImageView.loadImage(from: imageUrl)
        }
        establishmentName.text = model.name
        categoryImageView.image = model.category?.icon
        categoryView.backgroundColor = model.category?.primaryColor
        rateLabel.text = String(model.rate)
    }
    
}
