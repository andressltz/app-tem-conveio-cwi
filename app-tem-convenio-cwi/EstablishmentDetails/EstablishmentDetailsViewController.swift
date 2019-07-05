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
    }
    

}
