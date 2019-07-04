//
//  DesignableImageView.swift
//  app-tem-convenio-cwi
//
//  Created by Marielle Wronka on 02/07/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableImageView: UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.asCircle()
    }
    
}
