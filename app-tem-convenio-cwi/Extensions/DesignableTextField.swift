//
//  DesignableView.swift
//  app-tem-convenio-cwi
//
//  Created by Marielle Wronka on 27/06/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableTextField: UITextField {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setLeftPaddingPoints(15)
        self.setRightPaddingPoints(15)
    }
}

@IBDesignable
class DesignablePasswordTextField: UITextField {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setLeftPaddingPoints(15)
        self.setRightPaddingPoints(40)
    }
}
