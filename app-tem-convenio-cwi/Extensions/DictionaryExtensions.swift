//
//  DictionaryExtensions.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 22/06/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import Foundation

extension Dictionary {
    
    func percentEscaped() -> String {
        return map { (key, value) in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
            }.joined(separator: "&")
    }
}
