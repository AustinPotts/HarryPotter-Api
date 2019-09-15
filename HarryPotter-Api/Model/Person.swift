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
        case gender
        case height
        case eyeColor = "eye_color"
        case mass
        case skinColor = "skin_color"
        
    }
    
    let name: String
    let birthYear: String
    let hairColor: String
    let gender: String
    let height: String
    let eyeColor: String
    let mass: String
    let skinColor: String
}
