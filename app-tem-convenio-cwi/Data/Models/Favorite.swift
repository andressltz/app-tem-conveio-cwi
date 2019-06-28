//
//  Favorite.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 26/06/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Favorite {
    let uid: String
    let establishmentUID: String
    
    init(withJson json: JSON) {
        self.uid = json["uid"].stringValue
        self.establishmentUID = json["establishmentUID"].stringValue
    }
    
}
