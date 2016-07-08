//
//  ViewController.swift
//  06_tipster
//
//  Created by Yung Kim on 7/7/16.
//  Copyright © 2016 Yung Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var groupSizeLabel: UILabel!
    @IBOutlet weak var tipPercentage1Label: UILabel!
    @IBOutlet weak var tipPercentage2Label: UILabel!
    @IBOutlet weak var tipPercentage3Label: UILabel!
    @IBOutlet weak var tipAmount1Label: UILabel!
    @IBOutlet weak var tipAmount2Label: UILabel!
    @IBOutlet weak var tipAmount3Label: UILabel!
    @IBOutlet weak var totalAmount1Label: UILabel!
    @IBOutlet weak var totalAmount2Label: UILabel!
    @IBOutlet weak var totalAmount3Label: UILabel!
    
    var amount: Double = 0.0
    var amountString: String = "0"
    var tipPercentage: Double = 14.0 // set default tip percentage to 14%
    var groupSize: Double = 1.0 // set default group size to 1
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        display(tipPercentage)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func keypadButtonPressed(sender: UIButton) {
        let keypadInput: String = sender.titleLabel!.text!
        if keypadInput == "c" {
            amount = 0
            amountString = "0"
        }
        else if (keypadInput == "0") && (amountString == "0") {
            return
        }
        else if (keypadInput == ".") && (amountString.rangeOfString(".") != nil) {
            return
        }
        else if amountString.characters.suffix(3).first! == "." {
            return
        } else {
            if (amountString == "0") && (keypadInput != ".") {
                amountString = ""
            }
            amountString += keypadInput
        }
        print(amountString.characters.suffix(3).first!)
        display(tipPercentage)
    }
    @IBAction func slidersMoved(sender: UISlider) {
        print(Int(sender.value))
        if sender.tag == 1 {
            tipPercentage = Double(Int(sender.value))
            display(tipPercentage)
        }
        if sender.tag == 2 {
            groupSize = Double(Int(sender.value))
            groupSizeLabel.text = "Group Size: \(Int(groupSize))"
            display(tipPercentage)
        }
    }
    func display(tipPercentage: Double) {
        amount = Double(amountString)!
        print("Amount: Double = \(amount)")
        
        tipPercentage1Label.text = "\(Int(tipPercentage)-5)%"
        tipPercentage2Label.text = "\(Int(tipPercentage))%"
        tipPercentage3Label.text = "\(Int(tipPercentage)+5)%"
        
        tipAmount1Label.text = "\(String(format:"%.2f", (amount/100) * Double(Int(tipPercentage)-5) / groupSize))"
        tipAmount2Label.text = "\(String(format:"%.2f", (amount/100) * Double(Int(tipPercentage)) / groupSize))"
        tipAmount3Label.text = "\(String(format:"%.2f", (amount/100) * Double(Int(tipPercentage)+5) / groupSize))"
        
        totalAmount1Label.text = "\(String(format:"%.2f", amount / groupSize + (amount/100) * Double(Int(tipPercentage)-5) / groupSize))"
        totalAmount2Label.text = "\(String(format:"%.2f", amount / groupSize + (amount/100) * Double(Int(tipPercentage)) / groupSize))"
        totalAmount3Label.text = "\(String(format:"%.2f", amount / groupSize + (amount/100) * Double(Int(tipPercentage)+5) / groupSize))"
        
        amountLabel.text = amountString
    }
}

