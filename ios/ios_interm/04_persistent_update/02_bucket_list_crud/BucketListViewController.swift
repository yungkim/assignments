//
//  ViewController.swift
//  02_bucket_list_crud
//
//  Created by Yung Kim on 7/12/16.
//  Copyright © 2016 Yung Kim. All rights reserved.
//

import UIKit
import CoreData

class BucketListViewController: UITableViewController, CancelButtonDelegate, MissionDetailsViewControllerDelegate {
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    var missions = [Mission]()
    
    override func viewDidLoad() {
        fetchAllMissions()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func fetchAllMissions() {
        let userRequest = NSFetchRequest(entityName: "Mission")
        do {
            let results = try managedObjectContext.executeFetchRequest(userRequest)
            missions = results as! [Mission]
        } catch {
            print("\(error)")
        }
    }
    func saveMission() {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
                print("Success")
                fetchAllMissions()
            } catch {
                print("\(error)")
            }
        }
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // dequeue the cell from our storyboard
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell")!
        // All UITableViewCell objects have a build in textLabel so set it to the model that is corresponding to the row in array
        cell.textLabel?.text = missions[indexPath.row].details
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
                controller.missionToEdit = missions[indexPath.row].details
                controller.missionToEditIndexPath = indexPath.row
            }
        }
    }
    func missionDetailsViewController(controller: MissionDetailsViewController, didFinishAddingMission new_mission: String) {
        dismissViewControllerAnimated(true, completion: nil)
        let mission = NSEntityDescription.insertNewObjectForEntityForName("Mission", inManagedObjectContext: managedObjectContext) as! Mission
        mission.details = new_mission
        saveMission()
    }
    func missionDetailsViewController(controller: MissionDetailsViewController, didFinishEditingMission mission: String, atIndexPath indexPath: Int) {
        dismissViewControllerAnimated(true, completion: nil)
        missions[indexPath].details = mission
        saveMission()
        tableView.reloadData()
    }
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        let commit = missions[indexPath.row]
        managedObjectContext.deleteObject(commit)
        saveMission()
    }

}

