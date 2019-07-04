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
    var recommendationUID: String?
    
    private lazy var requestsHandler = RequestsHandler()
    private lazy var storageHandler = StorageHandler()
    
    var selectedCategory: Int? {
        didSet {
            if let tag = self.selectedCategory {
                self.view?.onCategorySelected(categoryTag: tag)
            }
        }
    }
    var image: UIImage? {
        didSet {
            if let image = self.image {
                self.view?.onImageSelected(image: image)
            }
        }
    }
    
    func saveEstablishment(establishmentParams: [String: Any?], establishmentDetailsParams: [String: Any?]) {
        self.requestsHandler.make(withEndpoint: .saveEstablishment, withParams: establishmentParams) { (result) in
            guard case let .success(json) = result else {
                //todo: handle error
                return
            }
            if let json = json {
                let establishment = Establishment(withJson: json)
                var params: [String: Any?] = [:]
                params.merge(establishmentDetailsParams, uniquingKeysWith: { (first, last) -> Any? in
                    first
                })
                let uid = establishment.uid
                params["uid"] = uid
                self.requestsHandler.make(withEndpoint: .saveDetailedEstablishment(establishmentUID: uid), withParams: params, completion: { (result) in
                    guard case .success = result else {
                        //todo: handle error
                        return
                    }
                    if let recommendationUID = self.recommendationUID {
                        self.requestsHandler.make(withEndpoint: .removeRecommendation(recommendationUID: recommendationUID), completion: { (result) in
                            guard case .success = result else {
                                //todo: handle error
                                return
                            }
                            self.view?.onRecommendationSaved()
                        })
                    } else {
                        //todo: handle failure
                    }
                })
            } else {
                //todo: handle failure
            }
        }
    }
    
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
        
        var establishentParams: [String: Any?] = [:]
        establishentParams["name"] = name
        establishentParams["category"] = category.rawValue
        establishentParams["rate"] = 0.0
        
        var establishmentDetailsParams: [String: Any?] = [:]
        establishmentDetailsParams.merge(establishentParams) { (first, _) -> Any? in
            first
        }
        establishmentDetailsParams["phone"] = phone
        establishmentDetailsParams["email"] = email
        establishmentDetailsParams["address"] = address
        establishmentDetailsParams["about"] = about
        
        if let image = self.image {
            self.storageHandler.upload(name: name, image: image) { (result) in
                guard case let .success(imageURL) = result else {
                    //todo: handle failure
                    return
                }
                establishentParams["image"] = imageURL
                establishmentDetailsParams["image"] = imageURL
                self.saveEstablishment(establishmentParams: establishentParams, establishmentDetailsParams: establishmentDetailsParams)
            }
        } else {
            if let imageURL = imageURL {
                establishentParams["image"] = imageURL
                establishmentDetailsParams["image"] = imageURL
            }
            saveEstablishment(establishmentParams: establishentParams, establishmentDetailsParams: establishmentDetailsParams)
        }
    }
    
}
