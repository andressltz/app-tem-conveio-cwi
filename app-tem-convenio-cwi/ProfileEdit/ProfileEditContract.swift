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
    func onImageSelected(image: UIImage)
    func onProfileSaved()
    func onFailure(error: BaseError)
}

protocol ProfileEditPresenterType {
    func fetchData()
    func saveUser(
        withUID uid: String,
        withName name: String?,
        withEmail email: String?,
        withProfession profession: String?,
        withBirth birthday: Date?,
        withPhone phone: String?,
        withAbout about: String?,
        withImageURL imageURL: String?
    )
}
