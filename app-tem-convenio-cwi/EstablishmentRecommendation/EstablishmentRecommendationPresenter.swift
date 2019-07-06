//
//  EstablishmentRecommendationPresenter.swift
//  app-tem-convenio-cwi
//
//  Created by Ândres Schultz on 06/07/19.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

class EstablishmentRecommendationPresenter: NSObject {
    
    private var storageHandler = StorageHandler()
    private var requestsHandler = RequestsHandler()
    
    weak var view: EstablishmentRecommendationViewType?
    
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
    
    private func handleError(error: BaseError) {
        DispatchQueue.main.async {
            self.view?.onFailure(error: error)
        }
    }
    
    func saveRecommendation(establishmentParams: [String: Any?]) {
        requestsHandler.make(withEndpoint: .recommendEstablishment, withParams: establishmentParams) { (result) in
            guard case .success(_) = result else {
                if case let .failure(error) = result {
                    self.handleError(error: error)
                }
                return
            }
            self.view?.onRecommendationSaved()
        }
    }
}

extension EstablishmentRecommendationPresenter: EstablishmentRecommendationPresenterType {
    
    func saveRecommendation(withImage imageURL: String?, withName name: String?, withCategory category: String?) {
        guard let name = name, !name.isEmpty else {
            self.handleError(error: ValidationError.invalidEstablishmentName)
            return
        }
        
        guard let categoryTag = selectedCategory else {
            self.handleError(error: ValidationError.invalidCategory)
            return
        }
        
        var userParams: [String: Any?] = [:]
        userParams["name"] = Session.instance.loggedUser?.name
        userParams["email"] = Session.instance.loggedUser?.email
        userParams["uid"] = Session.instance.loggedUser?.uid
        
        var params: [String: Any?] = [:]
        params["name"] = name
        params["category"] = Category(tag: categoryTag).rawValue
        params["user"] = userParams
        
        if let image = self.image {
            storageHandler.upload(name: name, image: image) { (result) in
                guard case let .success(imageURL) = result else {
                    if case let .failure(error) = result {
                        self.handleError(error: error)
                    }
                    return
                }
                params["image"] = imageURL
                self.saveRecommendation(establishmentParams: params)
            }
        } else {
            self.saveRecommendation(establishmentParams: params)
        }
    }
        
}
