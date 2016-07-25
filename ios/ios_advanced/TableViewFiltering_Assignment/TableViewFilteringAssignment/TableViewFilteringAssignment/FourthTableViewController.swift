//
//  FourthTableViewController.swift
//  TableViewFilteringAssignment
//
//  Created by Yung Kim on 7/25/16.
//  Copyright © 2016 Yung Kim. All rights reserved.
//

import UIKit

class FourthViewController: UITableViewController {
    
    //    4)  Only pokemon with id divisible by 13  (id % 13 == 0)
    
    //    http://brettbukowski.github.io/SwiftExamples/examples/strings/
    //    http://stackoverflow.com/questions/29448152/swift-filter-array-of-strings
    //    let filteredPkmn = Database.pkmn.filter { $0.rangeOfString("er") != nil }
    let filteredPkmn = Database.pkmn.enumerate().filter { idx, el in return (idx+1) % 13 == 0 }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SecondTable")
        print(Database.pkmn.enumerate().filter { idx, el in return (idx+1) % 13 == 0 })
//        [(12, "Weedle"), (25, "Raichu"), (38, "Jigglypuff"), (51, "Meowth"), (64, "Alakazam"), (77, "Rapidash"), (90, "Cloyster"), (103, "Cubone"), (116, "Seadra"), (129, "Gyarados"), (142, "Snorlax")]

        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // How many cells are we going to need?
    override func tableView(sender: UITableView, numberOfRowsInSection: Int) -> Int {
        // return an integer that indicates how many rows (cells) to draw
        return filteredPkmn.count
    }
    
    // How should I create each cell?
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Get the UITableViewCell and create/populate it with data then return it
        // dequeue the cell from our storyboard
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell")!
        // if the cell has a text label, set it to the model that is corresponding to the row in array
        cell.textLabel?.text = filteredPkmn[indexPath.row].element
        // return cell so that Table View knows what to draw in each row
        return cell
    }
    
    
}
