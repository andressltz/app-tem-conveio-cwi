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
}

extension EstablishmentsListPresenter: EstablishmentsListViewType {
    func reloadData() {
        print("reloadData")
    }
    
    func fetchData() {
        self.establishmentsList = [Establishment]()
        
        requestsHandler.make(withEndpoint: .establishments, completion: { (list) in
            guard case let .success(json) = list else {
                print("deu errrooo")
                return
            }
            
            json?.arrayValue.forEach({ (establishmentJson) in
                let establishment = Establishment(withJson: establishmentJson)
                self.establishmentsList.append(establishment)
            })
            DispatchQueue.main.async {
                self.view?.reloadData()
            }
        })
    }
    
}

extension EstablishmentsListPresenter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.establishmentsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "establishment", for: indexPath)
        
        if let establishmentCell = cell as? EstablishmentTableViewCell {
            establishmentCell.config(with: establishmentsList[indexPath.row])
        }
        
        return cell
    }
    
}
