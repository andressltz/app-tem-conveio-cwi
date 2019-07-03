//
//  RecommendationDetailsPresenter.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 30/06/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

class RecommendationDetailsPresenter: NSObject {
    
    weak var view: RecommentationDetailsViewType?
    private lazy var requestsHandler = RequestsHandler()
    var selectedCategory: Int? {
        didSet {
            if let tag = self.selectedCategory {
                self.view?.onCategorySelected(categoryTag: tag)
            }
        }
    }
    var image: UIImage?
    
}

extension RecommendationDetailsPresenter: RecommendationDetailsPresenterType {
    
    func saveRecommendation(withImage imageURL: String?, withName name: String?,
                            withPhone phone: String?, withEmail email: String?,
                            withAddress address: String?, withAbout about: String?) {
        
        guard let name = name, !name.isEmpty else {
            //todo: handle failure
            return
        }
        
        guard let categoryTag = selectedCategory else {
            //todo: no category selected
            return
        }
        
        let category = Category(tag: categoryTag)
        
        var params: [String: Any?] = [:]
        params["name"] = name
        params["phone"] = phone
        params["email"] = email
        params["address"] = address
        params["about"] = about
        params["image"] = imageURL
        params["category"] = category.rawValue
        params["rate"] = 0.0
        
        requestsHandler.make(withEndpoint: .saveEstablishment, withParams: params) { (result) in
            guard case .success = result else {
                //todo: handle error
                return
            }
            //todo: delete recommendation from database
            self.view?.onRecommendationSaved()
        }
    }
    
}
