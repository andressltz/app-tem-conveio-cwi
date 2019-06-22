//
//  RequestMakerError.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 22/06/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import Foundation

enum RequestMakerError: Error {
    case malformedURL
    case postBodyNotInformed
    case requestFailed
    case invalidData
    case decodingFailed
}
