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
    @IBOutlet weak var categoryTypeImageView: UIImageView!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var favoriteImageView: UIImageView!
    
    func config(with model: Establishment) {
        pictureImageView.loadImage(from: model.image!) // TODO: mudar esse optional
        establishmentName.text = model.name
        categoryTypeImageView.image = model.category?.icon
        rateLabel.text = String(model.rate)
//        favoriteImageView
//        model.category.
    }
    
}
