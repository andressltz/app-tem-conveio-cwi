//
//  Category.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 22/06/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Category {

    let id: Int
    let name: String
    var establishments: [Establishment]
    
    init(withJson json: JSON) {
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
        self.establishments = [Establishment]()
        json["establishments"].array?.forEach({ (json: JSON) in
            let establishment = Establishment.init(withJson: json)
            self.establishments.append(establishment)
        })
    }
}
