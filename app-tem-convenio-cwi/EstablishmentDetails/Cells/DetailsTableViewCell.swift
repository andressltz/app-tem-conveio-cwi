//
//  DetailsTableViewCell.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 05/07/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    @IBOutlet var buttonsCollection: [UIButton]!

    func config(with model: Establishment) {
        DispatchQueue.main.async {
            if let image = model.image {
                self.pictureImageView.loadImage(from: image)
            }
            self.nameLabel.text = model.name
            self.aboutLabel.text = model.about
            self.rateLabel.text = model.rate.description
        }
    }

}
