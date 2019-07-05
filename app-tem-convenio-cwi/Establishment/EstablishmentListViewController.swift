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
        
        self.presenter.view = self
        configSearchBar()
        configTableView()
        configNavigationButtons()
        self.presenter.fetchData()
    }
    
    private func configSearchBar() {
        self.searchController.delegate = self
        self.searchController.searchResultsUpdater = self
        self.searchController.searchBar.barTintColor = UIColor(named: "search-bar")
    }
    
    private func configTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = presenter
        self.tableView.tableHeaderView = searchController.searchBar
    }
    
    private func configNavigationButtons() {
        let recommendBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_add"), style: .plain, target: self, action: #selector(recommendNewEstablishment(_:)))
        let filterBarButton = UIBarButtonItem(image: UIImage(named: "ic_filter"), style: .plain, target: self, action: #selector(filterCategoryList(_:)))
        
        recommendBarButtonItem.tintColor = .black
        filterBarButton.tintColor = .black
        
        self.navigationItem.leftBarButtonItem = recommendBarButtonItem
        self.navigationItem.rightBarButtonItem = filterBarButton
    }
    
    func searchCategory(with name: String) {
        presenter.filterData(with: name)
    }
    
    @objc func recommendNewEstablishment(_ sender: UIBarButtonItem) {
        let establishmentsStoryboard = UIStoryboard(name: "Establishments", bundle: nil)
        let popup = establishmentsStoryboard.instantiateViewController(withIdentifier: "EstablishmentRecommendationViewController")
        
        self.present(popup, animated: true)
    }
    
    @objc func filterCategoryList(_ sender: UIBarButtonItem ) {
        let establishmentsStoryboard = UIStoryboard(name: "Establishments", bundle: nil)
        let popup = establishmentsStoryboard.instantiateViewController(withIdentifier: "EstablishmentFilterViewController")
        
        self.present(popup, animated: true)
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
