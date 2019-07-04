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
//                self.searchController.searchBar.barTintColor = .lightText
    }
    
    private func configTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = presenter
        self.tableView.tableHeaderView = searchController.searchBar
    }
    
    private func configNavigationButtons() {
//                self.navigationController!.navigationBar.barTintColor = .lightText
        
        let recommendBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_add"), style: .plain, target: self, action: #selector(recommendNewEstablishment(_:)))
        let filterBarButton = UIBarButtonItem(image: UIImage(named: "ic_filter"), style: .plain, target: self, action: #selector(filterList(_:)))
        
        recommendBarButtonItem.tintColor = .black
        filterBarButton.tintColor = .black
        
        self.navigationItem.leftBarButtonItem = recommendBarButtonItem
        self.navigationItem.rightBarButtonItem = filterBarButton
    }
    
    func searchCategory(with name: String) {
        presenter.filterData(with: name)
    }
    
    @objc func recommendNewEstablishment(_ sender: UIBarButtonItem) {
        print("aaaa")
    }
    
    @objc func filterList(_ sender: UIBarButtonItem ) {
        //        self.dismiss(animated: true, completion: nil)
        let sb = UIStoryboard(name: "Establishments", bundle: nil)
        let popup = sb.instantiateViewController(withIdentifier: "filterPopup")
        
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
