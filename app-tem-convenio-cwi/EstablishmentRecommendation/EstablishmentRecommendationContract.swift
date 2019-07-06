//
//  EstablishmentRecommendationContract.swift
//  app-tem-convenio-cwi
//
//  Created by Ândres Schultz on 06/07/19.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

protocol EstablishmentRecommendationViewType: AnyObject {
    
    func onCategorySelected(categoryTag: Int)
    
    func onImageSelected(image: UIImage)
    
    func onRecommendationSaved()
    
    func onFailure(error: BaseError)
    
}

protocol EstablishmentRecommendationPresenterType {
    
    func saveRecommendation(
        withImage imageURL: String?,
        withName name: String?,
        withCategory category: String?
    )
    
}
