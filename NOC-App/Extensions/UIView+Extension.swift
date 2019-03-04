//
//  UIImageView+Extension.swift
//  NOC-App
//
//  Created by Hassan El Desouky on 2/22/19.
//  Copyright © 2019 Hassan El Desouky. All rights reserved.
//

import UIKit

extension UIView {
    func makeRoundedCorners() {
        self.layer.cornerRadius = (self.frame.width / 2)
        self.layer.masksToBounds = true
    }
    
    func makeRoundedCorners(by value: Int) {
        self.layer.cornerRadius = CGFloat(value)
        self.layer.masksToBounds = true
    }
}
