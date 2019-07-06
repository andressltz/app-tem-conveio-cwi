//
//  FeedbackTableViewCell.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 05/07/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

class FeedbackTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    @IBOutlet var rateCollection: [UIImageView]!

    func config(with model: Feedback) {
        DispatchQueue.main.async {
            self.titleLabel.text = model.title
            self.nameLabel.text = model.user.name
            //self.dateLabel.text = model.date.monthAndName
            self.commentLabel.text = model.comment
            self.rateCollection.forEach({ (imageView) in
                let rate = Int(model.rate)
                if imageView.tag <= rate {
                    imageView.image = UIImage(named: "ic_star")
                } else {
                    imageView.image = UIImage(named: "ic_star_unselected")
                }
            })
        }
    }

}
