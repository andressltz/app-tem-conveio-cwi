//
//  ProfileEditPresenter.swift
//  app-tem-convenio-cwi
//
//  Created by Marielle Wronka on 04/07/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

class ProfileEditPresenter: NSObject {
    
    weak var view: ProfileEditViewType?
    private lazy var requestsHandler = RequestsHandler()
    
}

extension ProfileEditPresenter: ProfileEditPresenterType {
    
    func fetchData() {
        self.view?.loadData(user: Session.instance.loggedUser)
    }
    
}
