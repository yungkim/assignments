//
//  FilmsViewController.swift
//  Star Wars Encyclopedia
//
//  Created by Yung Kim on 7/18/16.
//  Copyright © 2016 Yung Kim. All rights reserved.
//

import UIKit

class FilmsViewController: UITableViewController {
    // Specify the url that we will be sending the GET Request to
    var films: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        StarWarsModel.getAllFilms() { // Notice how we are passing a block to the function (this becomes "completionHandler" in the function definition in StarWarsModel.swift)
            data, response, error in
            do {
                // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                if let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                    if let results = jsonResult["results"] {
                        for i in 0..<results.count {
                            let film = results[i].valueForKey("title")!
                            self.films.append(film as! String)
                            dispatch_async(dispatch_get_main_queue(), {
                                self.tableView.reloadData()
                            })
                        }
                    }
                }
            } catch {
                print("Something went wrong")
            }
        }
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the count of people
        return films.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Create a generic cell
        let cell = UITableViewCell()
        // set the default cell label to the corresponding element in the people array
        cell.textLabel?.text = films[indexPath.row]
        // return the cell so that it can be rendered
        return cell
    }
}