//
//  PersonController.swift
//  HarryPotter-Api
//
//  Created by Austin Potts on 9/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class PersonController {
    
    
    let baseURL = URL(string: "https://swapi.co/api/")!
    //CRUD
    
    var people: [Person] = []
    
    //The goal is to update the people array then call completion(), notifying the view controller that we have finished the fetch
    func searchForPeople(with searchTerm:String, completion: @escaping () -> Void){
        
        let peopleURL = baseURL.appendingPathComponent("people")
        
        var components = URLComponents(url: peopleURL, resolvingAgainstBaseURL: true)
        
        let searchItem = URLQueryItem(name: "search", value: searchTerm)
        
        components?.queryItems = [searchItem]
        
        //Ask the components to give us the formatted URL from the parts we gvce it
        guard let requestURL = components?.url else{
            completion()
            return
        }
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        
        //The data task hasnt gone to the API yet
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            
            //The data task has gone to the API and come back with data, response and error from API
            
            //Check for an error
            if let error = error{
                NSLog("Error Searching people: \(error)")
            }
            
            //See if there is data
            guard let data = data else {
                NSLog("No data")
                completion()
                return
            }
            
            //Decode the data
            do {
                let decoder = JSONDecoder()
                
                let personSearch = try decoder.decode(PersonSearch.self, from: data)
                
                self.people = personSearch.results
                
            } catch {
                NSLog("Error Decoding from data: \(error)")
            }
            completion()
            
            }.resume()
        
    }
    
    enum HTTPMethod: String{
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case delete = "DELETE"
    }
    
}
