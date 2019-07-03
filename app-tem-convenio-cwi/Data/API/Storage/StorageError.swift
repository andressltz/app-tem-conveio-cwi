//
//  StorageError.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 02/07/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import Foundation

enum StorageError: Error {
    case serverError
    case invalidData
    case invalidURL
}
