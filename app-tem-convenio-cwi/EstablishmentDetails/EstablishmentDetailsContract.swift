//
//  EstablishmentDetailsContract.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 05/07/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import Foundation
import UIKit

protocol EstablishmentDetailsViewType: AnyObject {
    func onFavoriteStateChanged(to enabled: Bool)
    func onEstablishmentLoaded(establishment: Establishment)
    func onFailure(error: BaseError)
}

protocol EstablishmentDetailsPresenterType {
    func fetchData(establishmentUID: String)
    func getCategory() -> Category
}
