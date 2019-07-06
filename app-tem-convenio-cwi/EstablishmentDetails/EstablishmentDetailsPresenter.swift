//
//  EstablishmentDetailsPresenter.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 05/07/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

class EstablishmentDetailsPresenter: NSObject {
    
    private var establishment: Establishment?
    private lazy var requestsHandler = RequestsHandler()
    
    weak var view: EstablishmentDetailsViewType?
    
}

extension EstablishmentDetailsPresenter: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 2:
            if let feedbacks = self.establishment?.feedbacks {
                if feedbacks.isEmpty {
                    return 1
                } else {
                    return feedbacks.count
                }
            }
            return 1
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "details", for: indexPath)
            if let detailsCell = cell as? DetailsTableViewCell {
                if let establishment = self.establishment {
                    detailsCell.config(with: establishment)
                }
            }
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "map", for: indexPath)
            if let mapCell = cell as? MapTableViewCell {
                mapCell.config(with: self.establishment?.address)
            }
            return cell
        default:
            if self.establishment?.feedbacks.isEmpty ?? true {
                let cell = tableView.dequeueReusableCell(withIdentifier: "empty-feedback", for: indexPath)
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "feedback", for: indexPath)
                if let feedbackCell = cell as? FeedbackTableViewCell {
                    if let feedback = self.establishment?.feedbacks[indexPath.row] {
                        feedbackCell.config(with: feedback)
                    }
                }
                return cell
            }
            
        }
    }
}

extension EstablishmentDetailsPresenter: EstablishmentDetailsPresenterType {
    
    func fetchData(establishmentUID: String) {
        requestsHandler.make(withEndpoint: .establishmentDetails(establishmentUID: establishmentUID)) { (result) in
            guard case let .success(json) = result else {
                if case let .failure(error) = result {
                    self.view?.onFailure(error: error)
                }
                return
            }
            if let json = json {
                self.view?.onEstablishmentLoaded(establishment: Establishment(withJson: json))
            } else {
                self.view?.onFailure(error: APIError.invalidData)
            }
        }
    }
    
    
    func getCategory() -> Category {
        return self.establishment?.category ?? Category(tag: 0)
    }
}
