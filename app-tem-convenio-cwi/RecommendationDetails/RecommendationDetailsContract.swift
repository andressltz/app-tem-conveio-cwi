//
//  RecommendationDetailsContract.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 30/06/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

protocol RecommentationDetailsViewType: AnyObject {
    func onCategorySelected(categoryTag: Int)
    func onImageSelected(image: UIImage)
    func onRecommendationSaved()
    func onFailure(error: BaseError)
}

protocol RecommendationDetailsPresenterType {
    func saveRecommendation(
        withImage imageURL: String?,
        withName name: String?,
        withPhone phone: String?,
        withEmail email: String?,
        withAddress address: String?,
        withAbout about: String?
    )
}
