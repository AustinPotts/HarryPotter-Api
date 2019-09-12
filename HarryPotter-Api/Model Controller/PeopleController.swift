//
//  PeopleController.swift
//  HarryPotter-Api
//
//  Created by Austin Potts on 9/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation


class PeopleController {
    
    let baseURL = URL(string: "http://hp-api.herokuapp.com/api/characters/")!
    
    func getPeople(searchTerm: String, completion: @escaping (Result<People, Error>)-> Void) {
        let requestURL = baseURL.appendingPathComponent(searchTerm.capitalized)
     
        URLSession.shared.dataTask(with: requestURL) { (data, _, error) in
            if let error = error {
                print("Error getting people: \(error)")
                completion(.failure(error))
                return
            }
            
            guard let data = data else{
                print("Error Getting Data")
                completion(.failure(NSError()))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let people = try decoder.decode(People.self, from: data)
                print(people)
                completion(.success(people))
                
            }  catch {
                print("Error decoding data type: \(error)")
                completion(.failure(error))
                
            }
            
        }.resume()
    }
    
    
    
}
