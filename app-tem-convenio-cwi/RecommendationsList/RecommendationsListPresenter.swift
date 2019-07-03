//
//  RecommendationsListPresenter.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 29/06/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

class RecommendationsListPresenter: NSObject {
    
    weak var view: RecommendationsListViewType?
    private lazy var requestsHandler = RequestsHandler()
    private var recommendations = [Recommendation]()
    var filteredRecommendations = [Recommendation]()
    
}

extension RecommendationsListPresenter: RecommendationsListPresenterType {
    
    func fetchData() {
        requestsHandler.make(withEndpoint: .recommendations) { (result) in
            guard case let .success(json) = result else {
                //todo: show failure alert
                return
            }
            self.recommendations = [Recommendation]()
            json?.arrayValue.forEach({ (recommendationJson) in
                let recommendationModel = Recommendation(withJson: recommendationJson)
                self.recommendations.append(recommendationModel)
                self.filteredRecommendations.append(recommendationModel)
            })
            DispatchQueue.main.async {
                self.view?.reloadData()
            }
        }
    }
    
    func filterData(with name: String?) {
        if let name = name {
            self.filteredRecommendations = self.recommendations.filter { (recommendation) -> Bool in
                return name.isEmpty || recommendation.name.lowercased().contains(name.lowercased())
            }
            self.view?.reloadData()
        }
    }
    
    func deleteRecommendation(withIndexPath indexPath: IndexPath) {
        let recommendation = self.filteredRecommendations[indexPath.row]
        requestsHandler.make(withEndpoint: .removeRecommendation(recommendationUID: recommendation.uid)) { (result) in
            guard case .success = result else {
                //todo: handle failure
                return
            }
            if let index = self.recommendations.firstIndex(where: { $0.uid == recommendation.uid }) {
                self.filteredRecommendations.remove(at: indexPath.row)
                self.recommendations.remove(at: index)
                DispatchQueue.main.async {
                    self.view?.onRecommendationDeleted(indexPath: indexPath)
                }
            }
        }
    }
    
}

extension RecommendationsListPresenter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredRecommendations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recommendation", for: indexPath)
        if let recommendationCell = cell as? RecommendationTableViewCell {
            recommendationCell.config(with: filteredRecommendations[indexPath.row])
        }
        return cell
    }
}
