//
//  ViewController.swift
//  01_beast_list
//
//  Created by Yung Kim on 7/8/16.
//  Copyright © 2016 Yung Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var insertTaskField: UITextField!
    @IBOutlet weak var tableView: UITableView!


    // Create this array at the top of your class as a property
    var tasks = ["Exercise for 30 minutes", "Wireframe for some project", "Do laundry"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // How many cells are we going to need?
    func tableView(sender: UITableView, numberOfRowsInSection: Int) -> Int {
        // return an integer that indicates how many rows (cells) to draw
        return tasks.count

    }
    
    // How should I create each cell?
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Get the UITableViewCell and create/populate it with data then return it
        // dequeue the cell from our storyboard
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell")!
        // if the cell has a text label, set it to the model that is corresponding to the row in array
        cell.textLabel?.text = tasks[indexPath.row]
        // return cell so that Table View knows what to draw in each row
        return cell
        
    }
    @IBAction func insertButtonPressed(sender: UIButton) {
        let text: String = insertTaskField.text!
        if text != "" {
            tasks.append(text)
            insertTaskField.text = nil
            tableView.reloadData()
        }
    }
}

