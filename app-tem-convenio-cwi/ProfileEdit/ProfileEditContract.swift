//
//  ProfileEditContract.swift
//  app-tem-convenio-cwi
//
//  Created by Marielle Wronka on 04/07/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

protocol ProfileEditViewType: AnyObject {
    func loadData(user: User?)
}

protocol ProfileEditPresenterType {
    func fetchData()
}
