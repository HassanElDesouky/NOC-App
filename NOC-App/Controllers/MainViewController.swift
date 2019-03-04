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
    var filteredServers = [Server]()
    var servers = [Server]()
    var pageNumber = 1
    var isLoadingPage = false
    var isSearching = false
    let cellId = "cellId"
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var filterAllButton: RadioButton!
    @IBOutlet weak var filterActiveButton: RadioButton!
    @IBOutlet weak var filterDownButton: RadioButton!
    @IBOutlet weak var filterAllLocationsSearchBar: UISearchBar!
    @IBOutlet weak var alertCount: UILabel!
    @IBOutlet weak var notificationButton: UIButton!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var networkButton: UIButton!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProfileButton()
        setupFilterButtons()
        setupLocationsSeachBar()
        setupUtilityButtons()
        fetchJSON(page: pageNumber)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true    // Hide status bar.
    }
    
    override func awakeFromNib() {
        self.view.layoutIfNeeded()
        resetFilterButtons()
    }
    
    // MARK: - Private Methods
    // MARK: UI
    fileprivate func setupProfileButton() {
        let image = UIImage(named: "profile")
        profileButton.imageView?.contentMode = .scaleAspectFill
        profileButton.setImage(image, for: .normal)
        profileButton.makeRoundedCorners()
    }
    
    fileprivate func setupFilterButtons() {
        filterAllButton?.alternateButton = [filterDownButton!, filterActiveButton!]
        filterDownButton?.alternateButton = [filterActiveButton!, filterAllButton!]
        filterActiveButton?.alternateButton = [filterDownButton!, filterAllButton!]
    }
    
    fileprivate func setupLocationsSeachBar() {
        var iconImage = UIImage(named: "locationFiltering")
        iconImage = iconImage?.maskWithColor(color: UIColor.FlatColor.Gray.IronGray)
        filterAllLocationsSearchBar.setImage(iconImage, for: .search, state: .normal)
    }
    
    fileprivate func setupUtilityButtons() {
        notificationButton.imageView?.setImageColor(color: UIColor.FlatColor.Gray.IronGray)
        menuButton.imageView?.setImageColor(color: UIColor.FlatColor.Gray.IronGray)
        networkButton.imageView?.setImageColor(color: UIColor.FlatColor.Gray.IronGray)
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
                    self.filteredServers = parsedJson.getContent()
                    self.servers = self.filteredServers
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
    
    func resetFilterButtons() {
        filterActiveButton.isSelected = false
        filterDownButton.isSelected = false
        filterAllButton.isSelected = true
    }
    
    // MARK: - Actions
    @IBAction func showAllServers(_ sender: RadioButton) {
        filteredServers = servers
        tableView.reloadData()
    }
    
    @IBAction func showActiveServers(_ sender: RadioButton) {
        filteredServers = servers
        filteredServers = filteredServers.filter { (server) -> Bool in
            let serverStatus = server.getStatus()
            return serverStatus == 1
        }
        tableView.reloadData()
    }
    
    @IBAction func showDownServers(_ sender: RadioButton) {
        filteredServers = servers
        filteredServers = filteredServers.filter { (server) -> Bool in
            let serverStatus = server.getStatus()
            return serverStatus == 2 || serverStatus == 3 || serverStatus == 4
        }
        tableView.reloadData()
    }
}

// MARK: - TableView DataSource methods
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredServers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
            as? ServerTableViewCell else { return UITableViewCell() }
        let index = indexPath.row
        cell.serverImageView.image = UIImage(named: "serverImage")
        cell.serverImageView.makeRoundedCorners() // Make the image has rounded corners.
        cell.serverNameLabel.text = filteredServers[index].getName()
        cell.serverIPAddress.text = filteredServers[index].getIpAddress()
        cell.serverDeviceIPSubnetMask.text = filteredServers[index].getIpSubnetMask()
        cell.statusView.backgroundColor = ServerStatus.setStatusColor(for: index, filteredServers)
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

// MARK: - SearchBar Delegate methods
extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            filteredServers = servers
            self.resetFilterButtons()
            tableView.reloadData()
            return
        }
        if searchBar == self.searchBar {
            filteredServers = filteredServers.filter({ (server) -> Bool in
                server.getName()?.lowercased().contains(searchText.lowercased()) ?? false
            })
            tableView.reloadData()
        } else if searchBar == self.filterAllLocationsSearchBar {
            //
        }
    }
}
