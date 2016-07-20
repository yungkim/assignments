//
//  ViewController.swift
//  02_bucket_list_crud
//
//  Created by Yung Kim on 7/12/16.
//  Copyright © 2016 Yung Kim. All rights reserved.
//

import UIKit

class BucketListViewController: UITableViewController, CancelButtonDelegate, MissionDetailsViewControllerDelegate {
    
    var missions: [Int: [String]] = [:]
    
    override func viewDidLoad() {
        getAllTasks()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func getAllTasks() {
        missions = [:]
        TaskModel.getAllTasks() {
            data, response, error in
            do {
                if let tasks = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSArray {
                    var i = 0
                    for task in tasks {
//                        print(task.valueForKey("objective")!)
                        self.missions[i] = [String(task.valueForKey("objective")!)]
                        self.missions[i]?.append(String(task.valueForKey("id")!))
                        i += 1
                        dispatch_async(dispatch_get_main_queue(), {
                            self.tableView.reloadData()
                        })
                    }
                }
            } catch {
                print("Something went wrong")
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // dequeue the cell from our storyboard
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell")!
        // All UITableViewCell objects have a build in textLabel so set it to the model that is corresponding to the row in array
        cell.textLabel?.text = missions[indexPath.row]![0]
        
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
                controller.missionToEdit = missions[indexPath.row]![0]
                controller.missionToEditIndexPath = indexPath.row
            }
        }
    }
    func missionDetailsViewController(controller: MissionDetailsViewController, didFinishAddingMission mission: String) {
        dismissViewControllerAnimated(true, completion: nil)
        TaskModel.addTaskWithObjective(mission) {
            data, response, error in
            do {
                dispatch_async(dispatch_get_main_queue(), {
                    self.getAllTasks()
                })
            } catch {
                print("Something went wrong")
            }
        }
        getAllTasks()
    }
    func missionDetailsViewController(controller: MissionDetailsViewController, didFinishEditingMission mission: String, atIndexPath indexPath: Int) {
        dismissViewControllerAnimated(true, completion: nil)
        print("Index#: \(indexPath)")
//        Int(missions[indexPath]![1])!, 
        TaskModel.editTaskWithId(Int(missions[indexPath]![1])!, objective: mission)
        {
            data, response, error in
            do {
                dispatch_async(dispatch_get_main_queue(), {
                    self.getAllTasks()
                })
            } catch {
                print("Something went wrong")
            }
        }

        
        tableView.reloadData()
    }
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        // print(missions[indexPath.row]![1]) // id value from database
        TaskModel.deleteTaskWithId(Int(missions[indexPath.row]![1])!)
        {
            data, response, error in
            do {
                dispatch_async(dispatch_get_main_queue(), {
                    self.getAllTasks()
                })
            } catch {
                print("Something went wrong")
            }
        }
    }
}

