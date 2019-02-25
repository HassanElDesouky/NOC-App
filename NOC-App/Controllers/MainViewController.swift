//
//  ViewController.swift
//  NOC-App
//
//  Created by Hassan El Desouky on 2/20/19.
//  Copyright © 2019 Hassan El Desouky. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate {
    
    // MARK: - Properites
    var servers = [Server]()
    let cellId = "cellId"

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchJSON() 
    }
    
    override var prefersStatusBarHidden: Bool {
        return true    // Hide status bar.
    }
    
    // MARK: - Private Methods.
    // MARK: Networking.
    fileprivate func fetchJSON() {
        let urlString = "http://www.mocky.io/v2/5c5c46f13900005a18e05b90"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if error != nil {
                    print("Failed to get data from url.")
                    return
                }
                guard let data = data else { return }
                // Fetching
                do {
                    let decoder = JSONDecoder()
                    let parsedJson = try decoder.decode(JSONFile.self, from: data)
                    self.servers = parsedJson.getContent()
                    self.tableView.reloadData()
                } catch let jsonError {
                    print("Failed after fetching, json error: \(jsonError)")
                }
            }
        }.resume()
    }
}

// MARK: - TableView DataSource methods
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return servers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
            as? ServerTableViewCell else { return UITableViewCell() }
        let index = indexPath.row
        cell.serverImageView.image = UIImage(named: "serverImage")
        cell.serverImageView.makeRoundedCorners() // Make the image has rounded corners.
        cell.serverNameLabel.text = servers[index].getName()
        cell.serverIPAddress.text = servers[index].getIpAddress()
        cell.serverDeviceIPSubnetMask.text = servers[index].getIpSubnetMask()
        cell.statusView.backgroundColor = ServerStatus.setStatusColor(for: index, servers)
        cell.statusView.makeRoundedCorners()
        
        // Make the cell not celectable.
        cell.selectionStyle = .none
        
        return cell
    }
}
