//
//  CustomTableViewCell.swift
//  NOC-App
//
//  Created by Hassan El Desouky on 2/21/19.
//  Copyright © 2019 Hassan El Desouky. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    //MARK: Outlets
    @IBOutlet weak var serverImageView: UIImageView!
    @IBOutlet weak var serverNameLabel: UILabel!
    @IBOutlet weak var serverIPAddress: UILabel!
    @IBOutlet weak var serverDeviceIPSubnetMask: UILabel!
    @IBOutlet weak var statusView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
