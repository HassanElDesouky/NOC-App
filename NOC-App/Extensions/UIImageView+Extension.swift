//
//  UIImageView+Extension.swift
//  NOC-App
//
//  Created by Hassan El Desouky on 3/4/19.
//  Copyright © 2019 Hassan El Desouky. All rights reserved.
//

import UIKit

// Obtained from https://stackoverflow.com/a/36591030/5025731
extension UIImageView {
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}

