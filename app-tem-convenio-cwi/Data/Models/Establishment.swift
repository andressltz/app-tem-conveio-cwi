//
//  Establishment.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 22/06/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import Foundation
import FirebaseDatabase
import SwiftyJSON

struct Establishment {
    
    let uid: String
    let name: String
    let category: Category?
    let image: String
    let rate: Double
    
    init(withJson json: JSON) {
        self.uid = json["uid"].stringValue
        self.name = json["name"].stringValue
        self.category = Category(rawValue: json["category"].stringValue)
        self.image = json["image"].stringValue
        self.rate = json["rate"].doubleValue
    }
}
