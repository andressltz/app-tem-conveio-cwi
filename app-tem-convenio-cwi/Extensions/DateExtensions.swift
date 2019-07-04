//
//  DateExtensions.swift
//  app-tem-convenio-cwi
//
//  Created by Marielle Wronka on 03/07/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import Foundation

extension Date {
    
    func toString() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let stringDate = dateFormatter.string(from: self)
        
        let formatDate = dateFormatter.date(from: stringDate)
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        return dateFormatter.string(from: formatDate!)
    }
    
}
