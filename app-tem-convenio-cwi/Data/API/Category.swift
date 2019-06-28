//
//  Category.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 25/06/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import Foundation

enum Category: String {
    
    case education
    case capacitation
    case languages
    case restaurants
    case others

    var name: String {
        switch self {
        case .education:
            return "educação"
        case .capacitation:
            return "capacitação"
        case .languages:
            return "linguas"
        case .restaurants:
            return "restaurantes"
        case .others:
            return "saude / lazer / entretenimento"
        }
    }
    
}
