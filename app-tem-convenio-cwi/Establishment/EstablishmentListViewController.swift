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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
        let filterCategoryBarButton = UIBarButtonItem(image: UIImage(named: "ic_filter"), style: .plain, target: self, action: #selector(filterCategoryList(_:)))
        
        recommendBarButtonItem.tintColor = .black
        filterCategoryBarButton.tintColor = .black
        
        self.navigationItem.leftBarButtonItem = recommendBarButtonItem
        self.navigationItem.rightBarButtonItem = filterCategoryBarButton
    }
    
    @objc func recommendNewEstablishment(_ sender: UIBarButtonItem) {
        let establishmentsStoryboard = UIStoryboard(name: "Establishments", bundle: nil)
        let recomendationViewController = establishmentsStoryboard.instantiateViewController(withIdentifier: "EstablishmentRecommendationViewController")
        
        self.present(recomendationViewController, animated: true)
    }
    
    @objc func filterCategoryList(_ sender: UIBarButtonItem ) {
        let establishmentsStoryboard = UIStoryboard(name: "Establishments", bundle: nil)
        let filterViewController = establishmentsStoryboard.instantiateViewController(withIdentifier: "EstablishmentFilterViewController") as! EstablishmentFilterViewController
        
        filterViewController.delegate = self
        
        self.present(filterViewController, animated: true)
    }
    
}

extension EstablishmentListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let establishmentDetailStoryboard = UIStoryboard(name: "EstablishmentDetail", bundle: nil)
        if let detailViewController = establishmentDetailStoryboard.instantiateViewController(withIdentifier: "EstablishmentDetailsViewController") as? EstablishmentDetailsViewController {
            detailViewController.establishment = self.presenter.filterEstablishmentsList[indexPath.row]
            self.navigationController?.present(detailViewController, animated: true)
        }
    }
}

extension EstablishmentListViewController: EstablishmentsListViewType {
    
    func onFailure(error: APIError) {
        self.showFailureAlert(withError: error)
    }
    
    
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

extension EstablishmentListViewController: EstablishmentFilterViewControllerDelegate {

    func filterList(_ category: Category?) {
        presenter.filterCategory(with: category)
    }
}
