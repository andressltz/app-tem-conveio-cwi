//
//  UIImageViewExtensions.swift
//  app-tem-convenio-cwi
//
//  Created by Ândres Schultz on 02/07/19.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit
import Nuke

extension UIImageView {
    
    func loadImage(from urlString: String) {
        if let url = URL(string: urlString) {
            let options = ImageLoadingOptions()
            
            Nuke.loadImage(with: url, options: options, into: self)
        }
    }
}
