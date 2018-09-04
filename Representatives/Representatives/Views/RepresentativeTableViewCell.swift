//
//  RepresentativeTableViewCell.swift
//  Representatives
//
//  Created by Eric Andersen on 9/3/18.
//  Copyright © 2018 Eric Andersen. All rights reserved.
//

import UIKit

class RepresentativeTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    
    
    var representative: Representative? {
        didSet {
            updateViews()
        }
    }
    
    
    func updateViews() {
        guard let representative = representative else { return }
        
        nameLabel.text = representative.name
        partyLabel.text = representative.party
        districtLabel.text = "District \(representative.district)"
        phoneLabel.text = representative.phone
        websiteLabel.text = representative.link
    }
}
