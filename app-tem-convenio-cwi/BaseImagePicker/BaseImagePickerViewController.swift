//
//  ImagePickerViewController.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 02/07/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

class BaseImagePickerViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var baseImagePickerCallback: BaseImagePickerProtocol?
    
    func addGestureToImageView(imageView: UIImageView) {
        let tapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(loadImage)
        )
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func loadImage() {
        let imageController = UIImagePickerController()
        imageController.delegate = self
        imageController.sourceType = UIImagePickerController.SourceType.photoLibrary
        imageController.allowsEditing = false
        self.present(imageController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            self.baseImagePickerCallback?.onImageLoaded(image: image)
        } else {
            self.baseImagePickerCallback?.onFailure()
        }
        self.dismiss(animated: true, completion: nil)
    }
    

}
