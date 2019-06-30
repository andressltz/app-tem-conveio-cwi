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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.view = self
        self.configTableView()
        self.presenter.fetchData()
    }
    
    private func configTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self.presenter
    }
    
    private func shouldShowEmptyWarning() {
        self.emptyWarningView.isHidden = !self.presenter.recommendations.isEmpty
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
        self.presenter.recommendations.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
        self.shouldShowEmptyWarning()
    }
    
}

extension RecommendationsListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //todo call recommendation details
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
