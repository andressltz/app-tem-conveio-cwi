//
//  EstablishmentFilterPresenter.swift
//  app-tem-convenio-cwi
//
//  Created by Ândres Schultz on 04/07/19.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

class EstablishmentFilterPresenter: NSObject {
    
    private lazy var requestsHandler = RequestsHandler()
    
    weak var view: EstablishmentsListViewType?
    
    private var establishmentsList = [Establishment]()
    
    var filterEstablishmentsList = [Establishment]()
    
}
