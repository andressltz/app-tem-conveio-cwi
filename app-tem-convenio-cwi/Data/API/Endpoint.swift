//
//  Endpoint.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 22/06/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

extension RequestMaker {
    
    enum Endpoint {
        
        case login
        case createAccount
        case categories(categoryId: Int)
        case saveFavorite(userId: Int, establishmentId: Int)
        case removeFavorite(userId: Int, establishmentId: Int)
        case recommendEstablishment
        case profile
        case editProfile
        case establishmentDetails(establishmentId: Int)
        case sendFeedback
        
        var url: String {
            switch self {
            case .login:
                return "login"
            case .createAccount:
                return ""
            case .categories(let categoryId):
                return "categories/\(categoryId)"
            case let .saveFavorite(userId, establishmentId):
                return "users/\(userId)/favorites/\(establishmentId)"
            case let .removeFavorite(userId, establishmentId):
                return "users/\(userId)/favorites/\(establishmentId)"
            case .recommendEstablishment:
                return ""
            case .profile:
                return ""
            case .editProfile:
                return ""
            case .establishmentDetails(let establishmentId):
                return "establishments/\(establishmentId)"
            case .sendFeedback:
                return ""
            }
        }
        
        var httpMethod: String {
            switch self {
            case .login, .createAccount, .saveFavorite, .recommendEstablishment, .editProfile, .sendFeedback:
                return HttpMethods.post.rawValue
            case .removeFavorite:
                return HttpMethods.delete.rawValue
            default:
                return HttpMethods.get.rawValue
            }
        }
    }
}
