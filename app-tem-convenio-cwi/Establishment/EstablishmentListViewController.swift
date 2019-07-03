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
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = presenter
        self.presenter.view = self
        self.searchController.delegate = self
        self.searchController.searchResultsUpdater = self
        self.tableView.tableHeaderView = searchController.searchBar
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

extension EstablishmentListViewController: UISearchControllerDelegate {
    
}

extension EstablishmentListViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        presenter.filterData(with: searchController.searchBar.text)
    }
    
}
