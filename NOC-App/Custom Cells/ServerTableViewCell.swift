//
//  CustomTableViewCell.swift
//  NOC-App
//
//  Created by Hassan El Desouky on 2/21/19.
//  Copyright © 2019 Hassan El Desouky. All rights reserved.
//

import UIKit

class ServerTableViewCell: UITableViewCell {
    
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
    
    func configureCell(_ servers: [Server], indexPath: IndexPath) {
        let index = indexPath.row
        serverImageView.image = UIImage(named: "serverImage")
        serverImageView.makeRoundedCorners()  // Make the image has rounded corners.
        serverNameLabel.text = servers[index].name
        serverIPAddress.text = servers[index].ipAddress
        serverDeviceIPSubnetMask.text = servers[index].ipSubnetMask?.rawValue
        statusView.backgroundColor = Status.setStatusColor(for: index, servers)
        statusView.makeRoundedCorners()
    }
    
}
