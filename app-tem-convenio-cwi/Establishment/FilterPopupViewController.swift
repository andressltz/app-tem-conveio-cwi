//
//  FilterPopupViewController.swift
//  app-tem-convenio-cwi
//
//  Created by Ândres Schultz on 03/07/19.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

class FilterPopupViewController: UIViewController {
    
    @IBOutlet weak var favoriteButton: DesignableButton!
    @IBOutlet weak var teachingButton: DesignableButton!
    @IBOutlet weak var trainingButton: DesignableButton!
    @IBOutlet weak var languageButton: DesignableButton!
    @IBOutlet weak var restaurantButton: DesignableButton!
    @IBOutlet weak var recreationButton: DesignableButton!
    
    private let presenter = EstablishmentsListPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.view = self
    }
    
    @IBAction func backgroundClick(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func favoriteFilterClick(_ sender: Any) {
        let storyboard = self.storyboard
        
        if let establishmentListViewController = storyboard?.instantiateViewController(withIdentifier: "EstablishmentListViewController") as? EstablishmentListViewController {

//            establishmentListViewController.searchCategory(with: "Uni")
//             print(presenter.filterData(with: "Uni"))
//            self.navigationController?.present(establishmentListViewController, animated: true)
        }
    
        dismiss(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! EstablishmentListViewController
        vc.searchCategory(with: "Uni")
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

extension FilterPopupViewController: EstablishmentsListViewType {
    
    func reloadData() {
//        let storyboard = self.storyboard
//        if let establishmentListViewController = storyboard?.instantiateViewController(withIdentifier: "EstablishmentListViewController") as? EstablishmentListViewController {
//            establishmentListViewController.viewDidLoad()
//        }
    }
    
}
