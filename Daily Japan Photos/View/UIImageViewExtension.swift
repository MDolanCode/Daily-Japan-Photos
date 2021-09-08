//
//  UIImageViewExtension.swift
//  Daily Japan Photos
//
//  Created by Matt Dolan External macOS on 2021-09-05.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(imageURL: String) {
        self.kf.setImage(with: URL(string: imageURL))
    }
}
