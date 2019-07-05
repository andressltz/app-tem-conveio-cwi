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
    
    init(tag: Int) {
        switch tag {
        case 0:
            self.init(rawValue: "teaching")!
        case 1:
            self.init(rawValue: "training")!
        case 2:
            self.init(rawValue: "language")!
        case 3:
            self.init(rawValue: "restaurant")!
        case 4:
            self.init(rawValue: "recreation")!
        default:
            self.init(rawValue: "recreation")!
        }
    }

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
            return "saúde / lazer / entretenimento"
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
    
    var tag: Int {
        switch self {
        case .teaching:
            return 0
        case .training:
            return 1
        case .language:
            return 2
        case .restaurant:
            return 3
        case .recreation:
            return 4
        }
    }
    
}
