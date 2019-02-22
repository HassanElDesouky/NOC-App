//
//  ViewController.swift
//  NOC-App
//
//  Created by Hassan El Desouky on 2/20/19.
//  Copyright © 2019 Hassan El Desouky. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Properites
    private var servers = [Server]()
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchJSON() 
    }
    
    // Hide status bar.
    override var prefersStatusBarHidden: Bool {
        return true
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

                print("Fetching")

                do {
                    let decoder = JSONDecoder()
                    let parsedFile = try decoder.decode(JSONFile.self, from: data)
                    self.servers = parsedFile.content
                    self.tableView.reloadData()
                } catch let jsonError {
                    print("Failed after fetching, json error: \(jsonError)")
                }
            }
        }.resume()
    }
}

extension MainViewController: UITableViewDataSource {
    
    // MARK: - TableView DataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return servers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        let idx = indexPath.row
        cell.serverImageView.image = UIImage(named: "serverImage")
        cell.serverImageView.makeRoundedCorners() // Make the image has rounded corners.
        cell.serverNameLabel.text = servers[idx].name
        cell.serverIPAddress.text = servers[idx].ipAddress
        cell.serverDeviceIPSubnetMask.text = servers[idx].ipSubnetMask
        switch servers[idx].status?.id {
        case 1:
            cell.statusView.backgroundColor = .green
        case 2:
            cell.statusView.backgroundColor = .orange
        case 3:
            cell.statusView.backgroundColor = .yellow
        case 4:
            cell.statusView.backgroundColor = .red
        default:
            cell.statusView.backgroundColor = .gray // For unknown values.
        }
        cell.statusView.makeRoundedCorners()
        
        // Make the cell not celectable.
        cell.selectionStyle = .none
        
        return cell
    }
}
