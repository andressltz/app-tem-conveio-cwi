//
//  Endpoint.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 22/06/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

extension RequestsHandler {
    
    enum Endpoint {
        
        case createUser(userUID: String)
        case establishments
        case saveEstablishment
        case saveDetailedEstablishment(establishmentUID: String)
        case saveFavorite(userUID: String)
        case removeFavorite(userUID: String, establishmentUID: String)
        case recommendEstablishment
        case recommendations
        case removeRecommendation(recommendationUID: String)
        case profile(userUID: String)
        case editProfile(userUID: String)
        case establishmentDetails(establishmentUID: String)
        case sendFeedback(establishmentUID: String)
        
        var url: String {
            switch self {
            case let .createUser(userUID):
                return "users/\(userUID)"
            case .establishments, .saveEstablishment:
                return "establishments"
            case let .saveDetailedEstablishment(establishmentUID):
                return "detailed-establishments/\(establishmentUID)"
            case let .saveFavorite(userUID):
                return "users/\(userUID)/favorites"
            case let .removeFavorite(userUID, establishmentUID):
                return "users/\(userUID)/favorites/\(establishmentUID)"
            case .recommendEstablishment, .recommendations:
                return "recommendations"
            case let .removeRecommendation(recommendationUID):
                return "recommendations/\(recommendationUID)"
            case let .profile(userUID), let .editProfile(userUID):
                return "users/\(userUID)"
            case .establishmentDetails(let establishmentUID):
                return "detailed-establishments/\(establishmentUID)"
            case .sendFeedback(let establishmentUID):
                return "establishments/\(establishmentUID)/feedbacks"
            }
        }
        
        var httpMethod: HttpMethods {
            switch self {
            case .saveEstablishment, .saveFavorite, .recommendEstablishment, .sendFeedback:
                return .post
            case .removeFavorite, .removeRecommendation:
                return .delete
            case .createUser, .editProfile, .saveDetailedEstablishment:
                return .patch
            case .establishments, .recommendations, .profile, .establishmentDetails:
                return .get
            }
        }
    }
}
