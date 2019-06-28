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
    let image: String?
    let rate: Double
    let phone: String?
    let email: String?
    let about: String?
    let address: String?
    var feedbacks: [Feedback]
    
    init(withJson json: JSON) {
        self.uid = json["uid"].stringValue
        self.name = json["name"].stringValue
        self.category = Category(rawValue: json["category"].stringValue)
        self.image = json["image"].string
        self.rate = json["rate"].doubleValue
        self.phone = json["phone"].string
        self.email = json["email"].string
        self.about = json["about"].string
        self.address = json["address"].string
        self.feedbacks = [Feedback]()
        json["feedbacks"].arrayValue.forEach { (feedbackJson) in
            let feedback = Feedback(withJson: feedbackJson)
            self.feedbacks.append(feedback)
        }
    }
    
    }

