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
    var servers = [Server]()
    var pageNumber = 1
    var isLoadingPage = false
    let cellId = "cellId"
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var filterAllButton: UIButton!
    @IBOutlet weak var filterActiveButton: UIButton!
    @IBOutlet weak var filterDownButton: UIButton!
    @IBOutlet weak var filterAllLocationsSearchBar: UISearchBar!
    @IBOutlet weak var alertCount: UILabel!
    @IBOutlet weak var notificationButton: UIButton!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var networkButton: UIButton!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProfileButton()
        fetchJSON(page: pageNumber)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true    // Hide status bar.
    }
    
    // MARK: - Private Methods
    // MARK: UI
    fileprivate func setupProfileButton() {
        let image = UIImage(named: "profile")
        profileButton.imageView?.contentMode = .scaleAspectFill
        profileButton.setImage(image, for: .normal)
        profileButton.makeRoundedCorners()
    }

    // MARK: Networking
    fileprivate func fetchJSON(page: Int) {
        let urlString = "http://www.mocky.io/v2/5c5c46f13900005a18e05b90?pageNumber=\(page)"
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
    
    func getServersList(page: Int) {
        isLoadingPage = true
        fetchJSON(page: page)
        tableView.reloadData()
    }
    
    func loadMoreData() {
        pageNumber += 1
        getServersList(page: pageNumber)
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

// MARK: - TableView Delegate methods
extension MainViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (((scrollView.contentOffset.y + scrollView.frame.size.height) > scrollView.contentSize.height ) && !isLoadingPage){
            // Load more when reach end.
            self.isLoadingPage = true
            self.loadMoreData()
        }
    }
}
