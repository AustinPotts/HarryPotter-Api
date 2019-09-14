//
//  APIController.swift
//  HarryPotter-Api
//
//  Created by Austin Potts on 9/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation


class APIController {
    
    //Set up the API URL
    let baseURL = URL(string: "https://restcountries.eu/rest/v2/all")!
    
    //Create the function to fetch the Data
    
    func getCountry(searchTerm: String, completion: @escaping (Result<Country, Error>)-> Void ) {
        
    //Append Search Term to URL
     let requestURL = baseURL.appendingPathComponent(searchTerm)
        
    //Reach out to the Internet
        URLSession.shared.dataTask(with: requestURL) { (data, _, error) in
            
            //Error Handling
            if let error = error{
                print("Error getting Country: \(error)")
                completion(.failure(error))
                return
            }
            //Error handling to Make sure to get the Data
            guard let data = data else {
                print("Error getting data")
                completion(.failure(NSError()))
                return
            }
        
            //Decode the JSON Data
            do{
                let decoder = JSONDecoder()
               let country = try decoder.decode(Country.self, from: data)
                print(country)
                completion(.success(country))
            } catch {
                print("Error Decoding JSON: \(error)")
                completion(.failure(error))
            }
            
        
        
       }.resume()
    
    }
    
}
