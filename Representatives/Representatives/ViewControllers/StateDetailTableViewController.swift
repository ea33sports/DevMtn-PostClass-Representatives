//
//  StateDetailTableViewController.swift
//  Representatives
//
//  Created by Eric Andersen on 9/3/18.
//  Copyright © 2018 Eric Andersen. All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController {
    
    var state: String?
    var representatives: [Representative] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let state = state else { return }
        RepresentativeController.shared.searchRepresentative(forState: state) { (representatives) in
            self.representatives = representatives ?? []
        }
    }
    

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return representatives.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repCell", for: indexPath) as? RepresentativeTableViewCell
        let rep = representatives[indexPath.row]
        
        // Configure the cell...
        cell?.representative = rep
        
        return cell ?? UITableViewCell()
    }
}
