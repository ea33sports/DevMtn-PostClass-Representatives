//
//  RepresentativeController.swift
//  Representatives
//
//  Created by Eric Andersen on 9/3/18.
//  Copyright © 2018 Eric Andersen. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    static let shared = RepresentativeController()
    
    private let baseURLString = "https://whoismyrepresentative.com/getall_reps_bystate.php"
    
    func searchRepresentative(forState state: String, completion: @escaping ([Representative]?) -> Void) {
        
        guard let baseURL = URL(string: baseURLString) else {
            fatalError("Bad base URL")
        }
        
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        let queryItems1 = URLQueryItem(name: "state", value: "\(state)")
        let queryItems2 = URLQueryItem(name: "output", value: "json")

        components?.queryItems = [queryItems1, queryItems2]
        
        guard let url = components?.url else { completion([]); return }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if let error = error {
                print("There was an error fetching from dataTask \(#function) \(error) \(error.localizedDescription)")
                completion([]); return
            }
            
            guard let data = data else { print("no data returned"); completion([]); return }
            
            let asciiStringFromData = String(data: data, encoding: .ascii)
            let dataAsUTF8 = Data(asciiStringFromData!.utf8)
            do {
                let representatives = try JSONDecoder().decode(Representatives.self, from: dataAsUTF8).representatives
                completion(representatives)
            } catch let error {
                print("There was an error decoding our object \(error) \(error.localizedDescription)"); completion([]); return
            }

        }.resume()
    }
}
