//
//  ViewController.swift
//  NOC-App
//
//  Created by Hassan El Desouky on 2/20/19.
//  Copyright © 2019 Hassan El Desouky. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fetchJSON()
    }
    
    // Remove status bar.
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK: Private Methods.
    fileprivate func fetchJSON() {
        let urlString = "http://www.mocky.io/v2/5c5c46f13900005a18e05b90"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("Failed to get data from url.")
                    return
                }
                guard let data = data else { return }
                
                print("Fetching")
                
                do {
                    let decoder = JSONDecoder()
                    let content = try decoder.decode(JSON.self, from: data)
                    print(content)
                } catch let jsonError {
                    print("Failed after fetching, json error: \(jsonError)")
                }
            }
        }.resume()
    }

}

