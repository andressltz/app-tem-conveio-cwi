//
//  EstablishmentListViewController.swift
//  app-tem-convenio-cwi
//
//  Created by Ândres Schultz on 30/06/19.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

class EstablishmentListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let presenter = EstablishmentsListPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = presenter
        self.presenter.view = self
        self.presenter.fetchData()
    }
    
}

extension EstablishmentListViewController: UITableViewDelegate {
    
}

extension EstablishmentListViewController: EstablishmentsListViewType {
    
    func reloadData() {
        self.tableView.reloadData()
    }
    
}
