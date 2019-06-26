//
//  UIViewControllerExtensions.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 22/06/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showFailureAlert(withError error: APIError) {
        //TODO: OPEN FAILURE ALERT PASSING ERROR
        print(error.localizedDescription)
    }
    
}
