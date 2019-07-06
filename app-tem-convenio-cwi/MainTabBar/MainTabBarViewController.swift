//
//  MainTabBarViewController.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 06/07/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import Foundation
import UIKit

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var controllers = self.viewControllers
        self.viewControllers = nil
        if let user = Session.instance.loggedUser {
            switch user.type {
            case .basic:
                controllers?.remove(at: 1)
                self.viewControllers = controllers
            case .manager:
                self.viewControllers = controllers
            }
        }
        
    }
    
}
