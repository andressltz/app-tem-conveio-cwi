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
    
}

extension EstablishmentDetailsPresenter: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 2:
            return self.establishment?.feedbacks.count ?? 0
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "feedback", for: indexPath)
            return cell
        }
    }
}
