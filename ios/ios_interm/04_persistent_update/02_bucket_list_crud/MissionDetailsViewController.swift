//
//  MissionDetailsViewController.swift
//  02_bucket_list_crud
//
//  Created by Yung Kim on 7/12/16.
//  Copyright © 2016 Yung Kim. All rights reserved.
//

import UIKit
class MissionDetailsViewController: UITableViewController {
    @IBOutlet weak var newMissionTextField: UITextField!
    weak var delegate: MissionDetailsViewControllerDelegate?
    weak var cancelButtonDelegate: CancelButtonDelegate?
    var missionToEdit: String?
    var missionToEditIndexPath: Int? 
    override func viewDidLoad() {
        super.viewDidLoad()
        newMissionTextField.text = missionToEdit
    }
    @IBAction func cancelBarButtonPressed(sender: UIBarButtonItem) {
        cancelButtonDelegate?.cancelButtonPressedFrom(self)
    }
    @IBAction func doneBarButtonPressed(sender: UIBarButtonItem) {
        // if we are editing then run the "didFinishEditingMission" method
        if var mission = missionToEdit {
            mission = newMissionTextField.text!
            delegate?.missionDetailsViewController(self, didFinishEditingMission: mission, atIndexPath: missionToEditIndexPath!)
        } else { // we are adding so run the "didFinishAddingMission" method
            if newMissionTextField.text! == "" {
                return
            }
            let mission = newMissionTextField.text!
            delegate?.missionDetailsViewController(self, didFinishAddingMission: mission)
        }
    }
    
}
