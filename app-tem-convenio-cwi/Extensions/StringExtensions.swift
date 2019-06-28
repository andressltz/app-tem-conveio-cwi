//
//  StringExtensions.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 26/06/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import Foundation

extension String {
    
    func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: self)
    }
    
}
