//
//  FeedbackHeaderTableViewCell.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 05/07/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

class FeedbackHeaderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var addFeedbackButton: UIButton!
    
    @IBAction func addFeedback(_ sender: UIButton) {
        //open add feedback screen
    }

    func config(with category: Category) {
        self.addFeedbackButton.setTitleColor(category.primaryColor ?? .black, for: .normal)
    }

}
