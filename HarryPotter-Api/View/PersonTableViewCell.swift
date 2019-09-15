//
//  PersonTableViewCell.swift
//  HarryPotter-Api
//
//  Created by Austin Potts on 9/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//
import Foundation
import UIKit

class PersonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var eyeColor: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var skinColorLabel: UILabel!
    
    var person: Person? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let person = person else { return }
        
        nameLabel.text = person.name
        ageLabel.text = person.birthYear
        colorLabel.text = "Hair color: \(person.hairColor)"
        genderLabel.text = "Gender: \(person.gender)"
        heightLabel.text = "Height: \(person.height)"
        eyeColor.text = "Eye Color: \(person.eyeColor)"
        massLabel.text = "Mass: \(person.mass)"
        skinColorLabel.text = "Skin: \(person.skinColor)"
    }

}
