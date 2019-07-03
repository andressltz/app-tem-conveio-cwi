//
//  LoginContract.swift
//  app-tem-convenio-cwi
//
//  Created by Marielle Wronka on 01/07/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

protocol LoginViewType: AnyObject {
    func onLoginSucess()
    func onFailure(error: APIError)
}

protocol LoginPresenterType {
    func login(withEmail email: String, withPassword password: String)
}
