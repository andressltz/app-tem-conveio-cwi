//
//  Session.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 27/06/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import Foundation

class Session {
    
    static let instance = Session()
    
    private init(){}
    
    var loggedUser: User?
}
