//
//  RecommendationDetailsPresenter.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 30/06/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import Foundation

class RecommendationDetailsPresenter: NSObject {
    
    weak var view: RecommentationDetailsViewType?
    private lazy var requestsHandler = RequestsHandler()
    
}

extension RecommendationDetailsPresenter: RecommendationDetailsPresenterType {
    
    func saveRecommendation(with params: [String: Any]) {
        requestsHandler.make(withEndpoint: .saveEstablishment, withParams: params) { (result) in
            guard case .success = result else {
                return
            }
        }
    }
    
    
}
