//
//  FilmDetailsViewController.swift
//  Star Wars Encyclopedia
//
//  Created by Yung Kim on 7/18/16.
//  Copyright © 2016 Yung Kim. All rights reserved.
//

import UIKit

protocol PeopleDetailsViewControllerDelegate
{
//    func passIndex(count: Int)
}

class PeopleDetailsViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    
    
    var getSpecies = false
    var index: Int?
    var url = ""
    override func viewDidLoad() {
        super.viewDidLoad()
//        print("Person Details: \(index!)")
//        url = url + String(index!)
        getData(url)
        
    }
    func getData(url: String?) {
        StarWarsModel.getPerson(url) { // Notice how we are passing a block to the function (this becomes "completionHandler" in the function definition in StarWarsModel.swift)
            data, response, error in
            do {
                
                // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                if let person = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                    dispatch_async(dispatch_get_main_queue()) {
                        if self.getSpecies == false {
                            self.nameLabel.text = "\(String(person.valueForKey("name")!))"
                            self.genderLabel.text = "Gender: \(String(person.valueForKey("gender")!))"
                            self.birthYearLabel.text = "Birth Year: \(String(person.valueForKey("birth_year")!))"
                            self.massLabel.text = "Mass: \(String(person.valueForKey("mass")!))"
                            let urlArr = person.valueForKey("species") as! NSArray
                            if urlArr == [] {
                                self.url = ""
                                self.speciesLabel.text = "Species: N/A"
                            } else {
                            self.url = urlArr[0] as! String
                            }
                        } else if self.getSpecies == true {
                            self.url = ""
                            self.speciesLabel.text = "Species: \(String(person.valueForKey("name")!))"
                        }
                        if self.url != "" {
                            self.getSpecies = true
                            self.getData(self.url)
                        }
                    }
                }
            } catch {
                print("Something went wrong")
            }
        }
    }
}