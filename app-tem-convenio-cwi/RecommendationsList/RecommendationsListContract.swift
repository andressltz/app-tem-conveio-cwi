//
//  RecommendationsContract.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 28/06/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

protocol RecommendationsListViewType: AnyObject {
    func reloadData()
    func onRecommendationDeleted(indexPath: IndexPath)
}

protocol RecommendationsListPresenterType: UITableViewDataSource {
    var view: RecommendationsListViewType? { get set }
    func fetchData()
    func filterData(with name: String?)
    func deleteRecommendation(withIndexPath indexPath: IndexPath)
}
