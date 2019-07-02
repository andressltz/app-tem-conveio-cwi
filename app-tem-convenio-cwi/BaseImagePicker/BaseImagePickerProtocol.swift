//
//  BaseImagePickerCallback.swift
//  app-tem-convenio-cwi
//
//  Created by Gunther Ribak on 02/07/2019.
//  Copyright © 2019 Cwi Software. All rights reserved.
//

import UIKit

protocol BaseImagePickerProtocol {
    func onFailure()
    func onImageLoaded(image: UIImage)
}
