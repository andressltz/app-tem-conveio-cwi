//
//  RecommendationsListViewController.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 29/06/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

class RecommendationsListViewController: UIViewController {
    
    @IBOutlet weak var loaderView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyWarningView: UIView!
    
    private let presenter = RecommendationsListPresenter()
    private let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.view = self
        self.configSearchBar()
        self.configTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.presenter.fetchData()
    }
    
    private func configSearchBar() {
        self.searchController.searchBar.barTintColor = UIColor(named: "search-bar")
        self.searchController.delegate = self
        self.searchController.searchResultsUpdater = self
    }
    
    private func configTableView() {
        self.tableView.tableHeaderView = self.searchController.searchBar
        self.tableView.delegate = self
        self.tableView.dataSource = self.presenter
    }
    
    private func shouldShowEmptyWarning() {
        self.emptyWarningView.isHidden = !self.presenter.filteredRecommendations.isEmpty
    }

}

extension RecommendationsListViewController: RecommendationsListViewType {
    
    func reloadData() {
        self.loaderView.isHidden = true
        self.tableView.reloadData()
        self.shouldShowEmptyWarning()
    }
    
    func onRecommendationDeleted(indexPath: IndexPath) {
        self.loaderView.isHidden = true
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
        self.shouldShowEmptyWarning()
    }
    
    func onFailure(error: APIError) {
        self.loaderView.isHidden = true
        self.showFailureAlert(withError: error)
        self.shouldShowEmptyWarning()
    }
    
}

extension RecommendationsListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = self.storyboard
        if let detailViewController = storyboard?.instantiateViewController(withIdentifier: "RecommendationDetailsViewController") as? RecommendationDetailsViewController {
            detailViewController.recommendation = self.presenter.filteredRecommendations[indexPath.row]
            self.navigationController?.present(detailViewController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let contextualAction = UIContextualAction(style: .destructive, title: "Recusar") { (action, view, handler) in
            self.loaderView.isHidden = false
            self.presenter.deleteRecommendation(withIndexPath: indexPath)
            handler(true)
        }
        let configuration = UISwipeActionsConfiguration(actions: [contextualAction])
        return configuration
    }
}

extension RecommendationsListViewController: UISearchControllerDelegate {
    
}

extension RecommendationsListViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let name = searchController.searchBar.text
        self.presenter.filterData(with: name)
    }
}
