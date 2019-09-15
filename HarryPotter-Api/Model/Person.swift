//
//  Person.swift
//  HarryPotter-Api
//
//  Created by Austin Potts on 9/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct PersonSearch: Codable {
    let results: [Person]
}


struct Person: Codable {
    
    enum CodingKeys: String, CodingKey {
        case name
        case birthYear = "birth_year"
        case hairColor = "hair_color"
    }
    
    let name: String
    let birthYear: String
    let hairColor: String
    
}
