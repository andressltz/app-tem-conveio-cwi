//
//  Endpoint.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 22/06/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

extension APIHandler {
    
    enum Endpoint {
        
        case createUser
        case establishments
        case saveFavorite(userUID: String, establishmentUID: String)
        case removeFavorite(userUID: String, establishmentUID: String)
        case recommendEstablishment
        case profile(userUID: String)
        case editProfile(userUID: String)
        case establishmentDetails(establishmentUID: String)
        case sendFeedback(establishmentUID: Int)
        
        var url: String {
            switch self {
            case .createUser:
                return "users"
            case .establishments:
                return "establishments"
            case let .saveFavorite(userUID):
                return "users/\(userUID)/favorites"
            case let .removeFavorite(userUID, establishmentUID):
                return "users/\(userUID)/favorites/\(establishmentUID)"
            case .recommendEstablishment:
                return "recommendations"
            case let .profile(userUID), let .editProfile(userUID):
                return "users/\(userUID)"
            case .establishmentDetails(let establishmentUID):
                return "establishments/\(establishmentUID)"
            case .sendFeedback(let establishmentUID):
                return "establishments/\(establishmentUID)/feedbacks"
            }
        }
        
        var httpMethod: HttpMethods {
            switch self {
            case .createUser, .saveFavorite, .recommendEstablishment, .sendFeedback:
                return .post
            case .removeFavorite:
                return .delete
            case .editProfile:
                return .patch
            default:
                return .get
            }
        }
    }
}
