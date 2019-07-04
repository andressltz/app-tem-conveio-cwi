//
//  ImagePickerError.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 04/07/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import Foundation

enum ImagePickerError: BaseError {
    
    case failure
    
    var title: String {
        switch self {
        case .failure:
            return "Erro ao carregar imagem"
        }
    }
    
    var message: String {
        switch self {
        case .failure:
            return "Não foi possível carregara a image, por favor tente novamente."
        }
    }
    
}
