//
//  BaseError.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 03/07/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import Foundation

protocol BaseError: Error {
    
    var title: String { get }
    var message: String { get }
    
}
