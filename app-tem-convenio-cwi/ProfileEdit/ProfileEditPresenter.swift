//
//  ProfileEditPresenter.swift
//  app-tem-convenio-cwi
//
//  Created by Marielle Wronka on 04/07/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

class ProfileEditPresenter: NSObject {
    
    weak var view: ProfileEditViewType?
    var profileUID: String?
    
    private lazy var requestsHandler = RequestsHandler()
    private lazy var storageHandler = StorageHandler()
    
    var image: UIImage? {
        didSet {
            if let image = self.image {
                self.view?.onImageSelected(image: image)
            }
        }
    }
    
    func saveUser(profileParams: [String: Any?]) {
        self.requestsHandler.make(withEndpoint: .editProfile(userUID: self.profileUID!), withParams: profileParams) { (result) in
            guard case let .success(json) = result else {
                if case let .failure(error) = result {
                    self.handleError(error: error)
                }
                return
            }
            if let json = json {
                let user = User(withJson: json)
                Session.instance.loggedUser = user
            }
            self.view?.onProfileSaved()
        }
    }
    
    private func handleError(error: BaseError) {
        DispatchQueue.main.async {
            self.view?.onFailure(error: error)
        }
    }
}

extension ProfileEditPresenter: ProfileEditPresenterType {
    
    func saveUser(withUID uid: String,
                  withName name: String?,
                  withEmail email: String?,
                  withProfession profession: String?,
                  withBirth birthday: Date?,
                  withPhone phone: String?,
                  withAbout about: String?,
                  withImageURL imageURL: String?) {
        
        guard let name = name, !name.isEmpty else {
            self.view?.onFailure(error: ValidationError.invalidName)
            return
        }
        
        self.profileUID = uid
        
        var profileParams: [String: Any?] = [:]
        profileParams["uid"] = uid
        profileParams["name"] = name
        profileParams["email"] = email
        profileParams["profession"] = profession
        profileParams["birthday"] = birthday
        profileParams["phone"] = phone
        profileParams["about"] = about
        
        if let image = self.image {
            self.storageHandler.upload(name: name, image: image) { (result) in
                guard case let .success(imageURL) = result else {
                    if case let .failure(error) = result {
                        self.handleError(error: error)
                    }
                    return
                }
                profileParams["imageURL"] = imageURL
                self.saveUser(profileParams: profileParams)
            }
        } else {
            if let imageURL = imageURL {
                profileParams["imageURL"] = imageURL
            }
            self.saveUser(profileParams: profileParams)
        }
        
    }
    
    func fetchData() {
        DispatchQueue.main.async {
            self.view?.loadData(user: Session.instance.loggedUser)
        }
    }
    
}
