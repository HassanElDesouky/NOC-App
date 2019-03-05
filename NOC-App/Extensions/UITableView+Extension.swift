//
//  UITableView+Extension.swift
//  NOC-App
//
//  Created by Hassan El Desouky on 3/5/19.
//  Copyright © 2019 Hassan El Desouky. All rights reserved.
//

import UIKit

// Obtained from https://stackoverflow.com/a/41513178/5025731
extension UITableView {
    func reloadData(with animation: UITableView.RowAnimation) {
        reloadSections(IndexSet(integersIn: 0..<numberOfSections), with: animation)
    }
}

