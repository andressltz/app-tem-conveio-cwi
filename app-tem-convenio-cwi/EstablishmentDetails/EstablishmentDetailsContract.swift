//
//  EstablishmentDetailsContract.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 05/07/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import Foundation

protocol EstablishmentDetailsViewType {
    func onFavoriteStateChanged(to enabled: Bool)
}

protocol EstablishmentDetailsPresenterType {
    func share()
}
