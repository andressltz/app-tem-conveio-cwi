//
//  Category.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 25/06/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

enum Category: String {
    
    case teaching
    case training
    case language
    case restaurant
    case recreation

    var name: String {
        switch self {
        case .teaching:
            return "educação"
        case .training:
            return "capacitação"
        case .language:
            return "linguas"
        case .restaurant:
            return "restaurantes"
        case .recreation:
            return "saude / lazer / entretenimento"
        }
    }
    
    var icon: UIImage? {
        return UIImage(named: "ic_\(self.rawValue)")
    }
    
    var primaryColor: UIColor? {
        return UIColor(named: "\(self.rawValue)-primary")
    }
    
    var secondaryColor: UIColor? {
        return UIColor(named: "\(self.rawValue)-secondary")
    }
    
}
