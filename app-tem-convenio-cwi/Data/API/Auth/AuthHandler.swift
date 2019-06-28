//
//  AuthHandler.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 26/06/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import Foundation
import FirebaseAuth
import SwiftyJSON

class AuthHandler {
    
    func createCredentials(email: String, password: String, username: String, completion: @escaping CompletionCallback) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            guard error == nil else {
                completion(.failure(.requestFailed))
                return
            }
            guard let user = authResult?.user else {
                completion(.failure(.invalidData))
                return
            }
            let userUID = user.uid
            RequestsHandler().make(
                withEndpoint: .createUser(userUID: userUID),
                withParams: ["uid": userUID, "name": username, "email": email, "type": UserType.basic.rawValue]
            ) {(result) in
                guard case .success = result else {
                    completion(.failure(.requestFailed))
                    return
                }
                self.login(email: email, password: password, completion: completion)
            }
        }
    }
    
    func login(email: String, password: String, completion: @escaping CompletionCallback) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            guard error == nil else {
                completion(.failure(.requestFailed))
                return
            }
            guard let user = authResult?.user else {
                completion(.failure(.invalidData))
                return
            }
            let userUID = user.uid
            RequestsHandler().make(withEndpoint: .profile(userUID: userUID), completion: completion)
        }
    }
}
