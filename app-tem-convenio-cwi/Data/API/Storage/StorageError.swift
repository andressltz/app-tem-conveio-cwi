//
//  StorageError.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 02/07/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import Foundation

enum StorageError: BaseError {

    case serverError
    case invalidData
    case invalidURL
    
    var title: String {
        switch self {
        case .serverError:
            return "Erro na Requisição!"
        case .invalidData:
            return "Arquivo inválido"
        case .invalidURL:
            return "URL inválida"
        }
    }
    
    var message: String {
        switch self {
        case .serverError:
            return "Ocorreu um erro na requisição, tente novamente."
        case .invalidData:
            return "Por favor verifique o arquivo enviado."
        case .invalidURL:
            return "Ocorreu um erro ao carregar a URL, tente novamente."
        }
    }
}
