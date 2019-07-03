//
//  RegisterContract.swift
//  app-tem-convenio-cwi
//
//  Created by Marielle Wronka on 01/07/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

protocol RegisterViewType: AnyObject {
    func onRegisterSucess()
    func onFailure(error: APIError)
}

protocol RegisterPresenterType {
    func createUser(withUsername username: String, withEmail email: String, withPassword password: String)
}
