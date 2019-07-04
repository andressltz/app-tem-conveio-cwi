//
//  EstablishmentsListPresenter.swift
//  app-tem-convenio-cwi
//
//  Created by Ândres Schultz on 01/07/19.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

class EstablishmentsListPresenter: NSObject {
    
    private lazy var requestsHandler = RequestsHandler()
    
    weak var view: EstablishmentsListViewType?
    
    private var establishmentsList = [Establishment]()
    
    var filterEstablishmentsList = [Establishment]()
}

extension EstablishmentsListPresenter: EstablishmentListPresenterType {
    
    func fetchData() {
        self.establishmentsList = [Establishment]()
        
        requestsHandler.make(withEndpoint: .establishments, completion: { (list) in
            guard case let .success(json) = list else {
                // TODO: fail alert
                return
            }
            
            json?.dictionary?.forEach({ (establishmentJson) in
                let establishment = Establishment(withJson: establishmentJson.value)
                self.establishmentsList.append(establishment)
                self.filterEstablishmentsList.append(establishment)
            })
            DispatchQueue.main.async {
                self.view?.reloadData()
            }
        })
    }
    
    func filterData(with name: String?) {
        if let name = name {
            filterEstablishmentsList = establishmentsList.filter({
                (establishment) -> Bool in
                return name.isEmpty || establishment.name.lowercased().contains(name.lowercased())
            })
            self.view?.reloadData()
        }
    }
    
}

extension EstablishmentsListPresenter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filterEstablishmentsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "establishment", for: indexPath)
        
        if let establishmentCell = cell as? EstablishmentTableViewCell {
            establishmentCell.config(with: filterEstablishmentsList[indexPath.row])
        }
        
        return cell
    }
    
}
