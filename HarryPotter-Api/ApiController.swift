//
//  ApiController.swift
//  HarryPotter-Api
//
//  Created by Austin Potts on 9/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation


class APIController {
    
    var character: [Character] = []
    
    //Create URL
    let baseURL = URL(string: "http://hp-api.herokuapp.com/api/characters")!
    
    //Create function for getting Characters
    func getCharacter(searchTerm: String, completion: @escaping (Result<Character, Error>)-> Void){
        
        let requestURL = baseURL.appendingPathComponent(searchTerm)
        
        //xCode talking to Api
        URLSession.shared.dataTask(with: requestURL) { (data, _, error) in
            
            //Error Handling
            if let error = error {
                print("Error getting characters: \(error)")
                completion(.failure(error))
                return
            }
            
            guard let data = data else{
                print("Error getting data")
                completion(.failure(NSError()))
                return
            }
            
            //Decode the JSON data
            do {
                let decoder = JSONDecoder()
               let charachter = try decoder.decode(Character.self, from: data)
                print(charachter)
                completion(.success(charachter))
            } catch {
                print("Error decoding character")
                
            }
            
        }
        
    }
    
    
    
}
