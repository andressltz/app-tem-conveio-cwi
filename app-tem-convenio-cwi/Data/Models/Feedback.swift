//
//  Feedback.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 27/06/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Feedback {
    
    let uid: String
    let title: String
    let comment: String
    let rate: Double
    let date: Date?
    let user: User
    
    init(withJson json: JSON) {
        self.uid = json["uid"].stringValue
        self.title = json["title"].stringValue
        self.comment = json["comment"].stringValue
        self.rate = json["rate"].doubleValue
        self.date = json["date"].string?.toDate()
        self.user = User(withJson: json["user"])
    }
    
}
