//
//  RegisterPresenter.swift
//  app-tem-convenio-cwi
//
//  Created by Marielle Wronka on 01/07/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

class RegisterPresenter : NSObject {
    
    weak var view: RegisterViewType?
    private lazy var requestHandler = RequestsHandler()
    
}

extension RegisterPresenter: RegisterPresenterType {
    
    func createUser(withUsername username: String, withEmail email: String, withPassword password: String) {
        AuthHandler().createCredentials(email: email, password: password, username: username) { (result) in
            guard case let .success(json) = result else {
                if case let .failure(error) = result {
                    self.view?.onFailure(error: error)
                }
                return
            }
            if let json = json {
                let user = User(withJson: json)
                Session.instance.loggedUser = user
            }
            self.view?.onRegisterSucess()
        }
    }
    
}
