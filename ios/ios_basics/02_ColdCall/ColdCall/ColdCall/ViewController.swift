//
//  ViewController.swift
//  ColdCall
//
//  Created by Yung Kim on 7/6/16.
//  Copyright © 2016 Yung Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    let names = ["Bryant", "Cody", "Courtney", "Daniel", "Jay", "Jimmy", "John", "Ryota", "Uyanga"]
    @IBAction func coldcallButtonPressed(sender: AnyObject) {
        nameLabel.text = names[Int(arc4random_uniform(UInt32(names.count)))]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameLabel.text = "Ready?"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

