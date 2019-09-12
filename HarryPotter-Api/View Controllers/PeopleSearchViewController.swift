//
//  PeopleSearchViewController.swift
//  HarryPotter-Api
//
//  Created by Austin Potts on 9/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PeopleSearchViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    

    var peopleController: PeopleController?
    var people: People? {
        didSet{
            updateViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
    }
    
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else {return}
        peopleController?.getPeople(searchTerm: searchTerm) { (people) in
            guard let searchedPeople = try? people.get() else {return}
            DispatchQueue.main.async {
                self.people = searchedPeople
            }
        }
    }
    
    
    func updateViews(){
        guard isViewLoaded else{return}
        guard let people = people else{return}
        title = people.name
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
