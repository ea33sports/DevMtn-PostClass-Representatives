//
//  Representative.swift
//  Representative
//
//  Created by Eric Andersen on 9/3/18.
//  Copyright © 2018 Eric Andersen. All rights reserved.
//

import Foundation

struct Representatives: Codable {
    
    let representatives: [Representative]
    
    private enum CodingKeys: String, CodingKey {
        case representatives = "results"
    }
}

struct Representative: Codable {
        
    let name: String
    let party: String
    let state: String
    let district: String
    let phone: String
    let office: String
    let link: String
}
