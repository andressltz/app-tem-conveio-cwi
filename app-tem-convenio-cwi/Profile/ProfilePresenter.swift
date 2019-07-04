//
//  ProfilePresenter.swift
//  app-tem-convenio-cwi
//
//  Created by Marielle Wronka on 03/07/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

class ProfilePresenter: NSObject {
    
    weak var view: ProfileViewType?
    private lazy var requestsHandler = RequestsHandler()
    
}

extension ProfilePresenter: ProfilePresenterType {
    
    func fetchData() -> User? {
        return Session.instance.loggedUser
    }
    
}



