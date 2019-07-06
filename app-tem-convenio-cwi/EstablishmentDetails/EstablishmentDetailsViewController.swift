//
//  EstablishmentDetailsViewController.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 05/07/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

class EstablishmentDetailsViewController: UIViewController {
    
    @IBOutlet weak var gradientView: GradientView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loaderView: UIView!
    
    @IBAction func goBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private let presenter = EstablishmentDetailsPresenter()
    var establishment: Establishment?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.view = self
        self.configTable()
        self.presenter.fetchData(establishmentUID: establishment?.uid ?? "")
    }
    
    func configTable() {
        self.tableView.delegate = self
        self.tableView.dataSource = self.presenter
    }
    

}

extension EstablishmentDetailsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "header-feedback")
            if let feedbackHeaderCell = cell as? FeedbackHeaderTableViewCell {
                feedbackHeaderCell.config(with: self.presenter.getCategory())
            }
            return cell
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        if section == 2 {
            return 55
        } else {
            return 0
        }
    }
    
}

extension EstablishmentDetailsViewController: EstablishmentDetailsViewType {
    func onFavoriteStateChanged(to enabled: Bool) {
        
    }
    
    func onEstablishmentLoaded(establishment: Establishment) {
        self.gradientView.startColor = establishment.category?.primaryColor ?? .white
        self.gradientView.endColor = establishment.category?.secondaryColor ?? .white
        self.tableView.reloadData()
    }
    
    func onFailure(error: BaseError) {
        self.showFailureAlert(withError: error)
    }
    
    
}
