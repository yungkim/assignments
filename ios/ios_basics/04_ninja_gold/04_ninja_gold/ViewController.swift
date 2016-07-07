//
//  ViewController.swift
//  04_ninja_gold
//
//  Created by Yung Kim on 7/6/16.
//  Copyright © 2016 Yung Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var farmLabel: UILabel!
    @IBOutlet weak var caveLabel: UILabel!
    @IBOutlet weak var houseLabel: UILabel!
    @IBOutlet weak var casinoLabel: UILabel!
    var gold: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        clearLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func buildingButtonPressed(sender: UIButton) {
        clearLabels()
        print(sender.tag)
        if (sender.tag == 1) {
            let farm_gold = Int(arc4random_uniform(11)+10)
            gold += farm_gold
            farmLabel.text = "You earned \(farm_gold) golds"
        }
        else if (sender.tag == 2) {
            let cave_gold = Int(arc4random_uniform(6)+5)
            gold += cave_gold
            caveLabel.text = "You earned \(cave_gold) golds"
        }
        else if (sender.tag == 3) {
            let house_gold = Int(arc4random_uniform(3)+2)
            gold += house_gold
            houseLabel.text = "You earned \(house_gold) golds"
        } else {
            let casino_gold = 50 + (-1 * Int(arc4random_uniform(101)))
            gold += casino_gold
            if (casino_gold >= 0) {
                casinoLabel.textColor = UIColor.blackColor()
                casinoLabel.text = "You earned \(casino_gold) golds"
            } else {
                casinoLabel.textColor = UIColor.redColor()
                casinoLabel.text = "You lost \(casino_gold) golds"
            }
        }
        scoreLabel.text = String(gold)
    }

    @IBAction func resetButtonPressed(sender: AnyObject) {
        gold = 0
        clearLabels()
    }
    func clearLabels() {
    scoreLabel.text = String(gold)
    farmLabel.text = ""
    caveLabel.text = ""
    houseLabel.text = ""
    casinoLabel.text = ""
    }

}

