//
//  LoginPresenter.swift
//  app-tem-convenio-cwi
//
//  Created by Marielle Wronka on 01/07/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

class LoginPresenter : NSObject {
    
    weak var view: LoginViewType?
    private lazy var requestHandler = RequestsHandler()
    
}

extension LoginPresenter: LoginPresenterType {
    
    func login(withEmail: String, withPassword: String) {
        AuthHandler().login(email: withEmail, password: withPassword) { (result) in
            guard case let .success(json) = result else {
                if case let .failure(error) = result {
                    DispatchQueue.main.async {
                        self.view?.onFailure(error: error)
                    }
                }
                return
            }
            if let json = json {
                let user = User(withJson: json)
                Session.instance.loggedUser = user
            }
            DispatchQueue.main.async {
                self.view?.onLoginSucess()
            }
        }
    }
}
