//
//  PeopleController.swift
//  HarryPotter-Api
//
//  Created by Austin Potts on 9/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation


class PeopleController {
    
    let baseURL = URL(string: "https://swapi.co/api/people/")!
    
    func getPeople(searchTerm: String, completion: @escaping (Result<People, Error>)-> Void) {
        let requestURL = baseURL.appendingPathComponent(searchTerm)
     
        URLSession.shared.dataTask(with: requestURL) { (data, _, error) in
            if let error = error {
                print("Error getting data from task: \(error)")
                completion(.failure(error))
                return
            }
        }
    }
    
    
    
}
