//
//  AuthError.swift
//  app-tem-convenio-cwi
//
//  Created by Marielle Wronka on 02/07/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

enum ValidationError: Error {
    case invalidName
    case invalidEmail
    case invalidPassword
    case notFoudUser
    
    var title: String {
        switch self {
        case .invalidName:
            return "Nome Inválido!"
        case .invalidEmail:
            return "Email Inválido!"
        case .invalidPassword:
            return "Senha Inválido!"
        case .notFoudUser:
            return "Oops!"
        }
    }
    
    var message: String {
        switch self {
        case .invalidName:
            return "Por favor, preencha o nome do usuário."
        case .invalidEmail:
            return "Por favor informe um e-mail vádido com domínio da CWI."
        case .invalidPassword:
            return "Por favor, informe a senha com no mínimo 6 dígitos."
        case .notFoudUser:
            return "Não foi possível carregar os dados do usuário."
        }
    }
    
}
