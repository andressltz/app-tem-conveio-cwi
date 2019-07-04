//
//  UIImageViewExtensions.swift
//  Pokedex
//
//  Created by Gunther Ribak on 08/06/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit
import Nuke

extension UIImage {
    
    static let placeholderImage = UIImage(named: "image_no_picture")!
    
}

extension UIImageView {
    
    func loadImage(from urlString: String) {
        
        if let url = URL(string: urlString) {
            let options = ImageLoadingOptions(placeholder: .placeholderImage, failureImage: .placeholderImage)
            Nuke.loadImage(with: url, options: options, into: self)
        }
    }
    
    func asCircle() {
        self.layer.cornerRadius = self.frame.width / 2;
        self.layer.masksToBounds = true
    }
    
}
