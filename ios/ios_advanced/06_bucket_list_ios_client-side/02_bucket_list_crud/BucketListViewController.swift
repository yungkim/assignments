//
//  ViewController.swift
//  02_bucket_list_crud
//
//  Created by Yung Kim on 7/12/16.
//  Copyright © 2016 Yung Kim. All rights reserved.
//

import UIKit

class BucketListViewController: UITableViewController, CancelButtonDelegate, MissionDetailsViewControllerDelegate {
    
    var missions: [String] = []
    
    override func viewDidLoad() {
        TaskModel.getAllTasks() {
            data, response, error in
            do {
                if let tasks = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSArray {
                    for task in tasks {
                        print(task.valueForKey("objective")!)
                        self.missions.append(String(task.valueForKey("objective")!))
                        dispatch_async(dispatch_get_main_queue(), {
                            self.tableView.reloadData()
                        })
                    }
                }
            } catch {
                print("Something went wrong")
            }
        }
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // dequeue the cell from our storyboard
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell")!
        // All UITableViewCell objects have a build in textLabel so set it to the model that is corresponding to the row in array
        cell.textLabel?.text = missions[indexPath.row]
        // return cell so that Table View knows what to draw in each row
        return cell
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return missions.count
    }
    func cancelButtonPressedFrom(controller: UIViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("MissionDetails", sender: tableView.cellForRowAtIndexPath(indexPath))
    }
    @IBAction func addButtonPressed(sender: UIBarButtonItem) {
        performSegueWithIdentifier("MissionDetails", sender: self)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print(sender)
        if sender!.text == nil {
            print("Add Mission")
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! MissionDetailsViewController
            controller.cancelButtonDelegate = self
            controller.delegate = self
        } else if sender!.text != nil {
            print("Edit Mission")
            
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! MissionDetailsViewController
            controller.cancelButtonDelegate = self
            controller.delegate = self
            // Here we set the missionToEdit so that we can have the mission text on the MissionDetailsViewController
            if let indexPath = tableView.indexPathForCell(sender as! UITableViewCell) {
                controller.missionToEdit = missions[indexPath.row]
                controller.missionToEditIndexPath = indexPath.row
            }
        }
    }
    func missionDetailsViewController(controller: MissionDetailsViewController, didFinishAddingMission mission: String) {
        dismissViewControllerAnimated(true, completion: nil)
        missions.append(mission)
        tableView.reloadData()
    }
    func missionDetailsViewController(controller: MissionDetailsViewController, didFinishEditingMission mission: String, atIndexPath indexPath: Int) {
        dismissViewControllerAnimated(true, completion: nil)
        missions[indexPath] = mission
        tableView.reloadData()
    }
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        // remove the mission at indexPath
        missions.removeAtIndex(indexPath.row)
        // reload the table view
        tableView.reloadData()
    }
}

