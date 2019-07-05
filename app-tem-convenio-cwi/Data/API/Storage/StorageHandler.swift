//
//  StorageHandler.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 02/07/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import Foundation
import FirebaseStorage

class StorageHandler {
    
    var ref: StorageReference!
    private let reachability = Reachability()
    
    init() {
        ref = Storage.storage().reference()
    }
    
    func upload(name: String, image: UIImage, completion: @escaping StorageCompletionCallback) {
        guard reachability.isConnectedToNetwork() else {
            completion(.failure(.noInternetConnection))
            return
        }
        let imageRef = ref.child("\(name).jpg")
        guard let data = image.jpegData(compressionQuality: 0.7) else {
            completion(.failure(.invalidData))
            return
        }
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        imageRef.putData(data, metadata: metadata) { (metadata, error) in
            imageRef.downloadURL { (url, error) in
                guard error == nil else {
                    completion(.failure(.serverError))
                    return
                }
                guard let downloadURL = url else {
                    completion(.failure(.invalidURL))
                    return
                }
                completion(.success(downloadURL.absoluteString))
            }
        }
    }
    
}
