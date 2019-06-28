//
//  User.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 26/06/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import Foundation
import SwiftyJSON

struct User {
    
    let uid: String
    let name: String
    let email: String
    let type: UserType
    let profession: String?
    let birthday: Date?
    let phone: String?
    let about: String?
    let imageURL: String?
    var favorites: [Favorite]
    
    init(withJson json: JSON) {
        self.uid = json["uid"].stringValue
        self.name = json["name"].stringValue
        self.email = json["email"].stringValue
        self.type = UserType(rawValue: json["type"].stringValue) ?? UserType.basic
        self.profession = json["profession"].string
        self.birthday = json["birthday"].string?.toDate()
        self.phone = json["phone"].string
        self.about = json["about"].string
        self.imageURL = json["image"].string
        self.favorites = [Favorite]()
        json["favorites"].arrayValue.forEach { (favoriteJson) in
            let favorite = Favorite(withJson: favoriteJson)
            self.favorites.append(favorite)
        }
    }
}
