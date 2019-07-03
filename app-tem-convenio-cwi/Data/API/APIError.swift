//
//  RequestMakerError.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 22/06/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import Foundation

enum APIError: Error {
    case missingParams
    case requestFailed
    case invalidData
    case decodingFailed
    
    var title: String {
        switch self {
        case .missingParams:
            return "Faltam Parâmetros!"
        case .requestFailed:
            return "Erro na Requisição!"
        case .invalidData:
            return "Dados Inválidos!"
        case .decodingFailed:
            return "Erro ao Decodificar!"
        }
    }
    
    var message: String {
        switch self {
        case .missingParams:
            return "Por favor, informe todos os parâmetros."
        case .requestFailed:
            return "Ocorrou um erro na requisição, tente novamente."
        case .invalidData:
            return "Por favor, verificaque os dados informados"
        case .decodingFailed:
            return "Ocorrou um erro na decodificação, tente novamente."
        }
    }
    
}
