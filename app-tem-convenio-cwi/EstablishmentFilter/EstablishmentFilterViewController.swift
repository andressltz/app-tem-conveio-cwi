//
//  EstablishmentFilterViewController.swift
//  app-tem-convenio-cwi
//
//  Created by Ândres Schultz on 03/07/19.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

class EstablishmentFilterViewController: UIViewController {
    
    @IBOutlet weak var favoriteButton: DesignableButton!
    @IBOutlet weak var teachingButton: DesignableButton!
    @IBOutlet weak var trainingButton: DesignableButton!
    @IBOutlet weak var languageButton: DesignableButton!
    @IBOutlet weak var restaurantButton: DesignableButton!
    @IBOutlet weak var recreationButton: DesignableButton!
    
    private let presenter = EstablishmentFilterPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backgroundClick(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func favoriteFilterClick(_ sender: Any) {
        
        
        dismiss(animated: true)
    }

    @IBAction func teachingFilterClick(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func trainingFilterClick(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func languageFilterClick(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func restaurantFilterClick(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func recreationFilterClick(_ sender: Any) {
        dismiss(animated: true)
    }
}
