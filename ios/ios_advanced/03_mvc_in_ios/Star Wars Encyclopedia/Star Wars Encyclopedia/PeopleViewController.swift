//
//  ViewController.swift
//  Star Wars Encyclopedia
//
//  Created by Yung Kim on 7/14/16.
//  Copyright © 2016 Yung Kim. All rights reserved.
//

import UIKit

class PeopleViewController: UITableViewController {
    // Specify the url that we will be sending the GET Request to
    var url = "http://swapi.co/api/people"
    var people: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        getData(url)
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the count of people
        return people.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Create a generic cell
        let cell = UITableViewCell()
        // set the default cell label to the corresponding element in the people array
        cell.textLabel?.text = people[indexPath.row]
        // return the cell so that it can be rendered
        return cell
    }
    func getData(url: String?) {
        StarWarsModel.getAllPeople(url) { // Notice how we are passing a block to the function (this becomes "completionHandler" in the function definition in StarWarsModel.swift)
            data, response, error in
            do {
                // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                if let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                    if let results = jsonResult["results"] {
                        // coercing the results object as an NSArray and then storing that in resultsArray
                        let resultsArray = results as! NSArray
                        for i in 1...resultsArray.count {
                            let person = resultsArray[i-1].valueForKey("name")!
                            self.people.append(person as! String)
                            dispatch_async(dispatch_get_main_queue(), {
                                self.tableView.reloadData()
                            })
                        }
                    }
                    if let url = jsonResult["next"] as? String {
                        self.url = url
                        print("Updated URL = \(self.url)")
                    } else {
                        self.url = ""
                    }
                }
                if self.url == "" {
                    print("--End of People Pages--")
                } else {
                    self.getData(self.url)
                }
            } catch {
                print("Something went wrong")
            }
        }

    }
}