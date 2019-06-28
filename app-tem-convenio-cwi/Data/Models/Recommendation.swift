//
//  Recommendation.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 27/06/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Recommendation {
    
    let uid: String
    let name: String
    let image: String?
    let category: Category?
    let user: User
    
    init(withJson json: JSON) {
        self.uid = json["uid"].stringValue
        self.name = json["name"].stringValue
        self.image = json["image"].string
        self.category = Category(rawValue: json["category"].stringValue)
        self.user = User(withJson: json["user"])
    }
    
}
