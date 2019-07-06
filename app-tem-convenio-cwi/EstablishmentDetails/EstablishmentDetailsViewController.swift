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
    
    private let presenter = EstablishmentDetailsPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.view = self
        self.presenter.fetchData(establishmentUID: "-LiuyY_Ovo1ylX3Hl5Nb")
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
    
}

extension EstablishmentDetailsViewController: EstablishmentDetailsViewType {
    func onFavoriteStateChanged(to enabled: Bool) {
        
    }
    
    func onEstablishmentLoaded(establishment: Establishment) {
        self.tableView.reloadData()
    }
    
    func onFailure(error: BaseError) {
        self.showFailureAlert(withError: error)
    }
    
    
}
