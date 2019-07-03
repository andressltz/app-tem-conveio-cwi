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
    
    init() {
        ref = Storage.storage().reference()
    }
    
    func upload(name: String, image: UIImage, completion: @escaping StorageCompletionCallback) {
        let imageRef = ref.child("\(name).png")
        guard let data = image.pngData() else {
            completion(.failure(.invalidData))
            return
        }
        let metadata = StorageMetadata()
        metadata.contentType = "image/png"
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
