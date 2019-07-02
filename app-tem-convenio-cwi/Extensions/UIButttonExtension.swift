//
//  UIButttonExtension.swift
//  app-tem-convenio-cwi
//
//  Created by Marielle Wronka on 27/06/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

extension UIButton {
    
    func isDisableButton() {
        self.isEnabled = false
        self.backgroundColor = UIColor.init(named: "disable")
    }
    
    func isEnabledButton() {
        self.isEnabled = true
        self.backgroundColor = UIColor.init(named: "primary-color")
    }
    
}
