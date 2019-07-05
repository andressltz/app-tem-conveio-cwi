//
//  CalendarViewController.swift
//  app-tem-convenio-cwi
//
//  Created by Marielle Wronka on 04/07/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {

    @IBOutlet weak var birthDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (Session.instance.loggedUser?.birthday) != nil {
            birthDatePicker.date = (Session.instance.loggedUser?.birthday)!
        }
    }
    
    @IBAction func touchDismiss(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func updateDate(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Profile", bundle: nil)
        let destination = storyboard.instantiateViewController(withIdentifier: "ProfileEditViewController") as! ProfileEditViewController
        
        destination.date = birthDatePicker.date
        dismiss(animated: true)
    }
    
}
