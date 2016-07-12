//
//  ViewController.swift
//  08_calculator
//
//  Created by Yung Kim on 7/11/16.
//  Copyright © 2016 Yung Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet var buttons: [UIButton]!
    
    var outputNumber: Double = 0.0
    var numberToCalculate: Double = 0.0
    var outputString: String = "0"
    var calculating: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        display()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func buttonsPressed(sender: UIButton) {
        
        var keypadInput: String = sender.titleLabel!.text!
        print("Button Pressed: \(keypadInput)")

        if keypadInput == "C" {
            reset()
        }
        else if ((keypadInput == "0") && (outputString == "0"))
            || ((keypadInput == ".") && (outputString.rangeOfString(".") != nil)) {
            return
        }
        else if keypadInput == "±" {
            if outputString == "0" {
                return
            }
            else if outputString.hasPrefix("-") == false {
                outputString = "-" + outputString
            }
            else if outputString.hasPrefix("-") {
                outputString = String(outputString.characters.dropFirst())
            }

        }

        else if keypadInput == "+" {
            if calculating == "" {
                calculating = "+"
                mathSymbolsPressed()
            }
            return
        }
        else if keypadInput == "-" {
            if calculating == "" {
                calculating = "-"
                mathSymbolsPressed()
            }
            return
        }
        else if keypadInput == "X" {
            if calculating == "" {
                calculating = "X"
                mathSymbolsPressed()
            }
            return
        }
        else if keypadInput == "/" {
            if calculating == "" {
                calculating = "/"
                mathSymbolsPressed()
            }
            return
        }
        else if keypadInput == "%" {
            if calculating == "" {
                outputString = String(Double(outputString)!/100)
                outputNumber = Double(outputString)!
            }
            else if (calculating == "+") || (calculating == "-") || ((calculating == "X") || (calculating == "/")){
                outputString = String((numberToCalculate/100) * Double(outputString)!)
            }

            if outputString.characters.suffix(2).first == "." {
                outputString = String(outputString.characters.dropLast(2))
            }
        }
        else if keypadInput == "=" {
            if calculating == "+" {
                outputNumber = numberToCalculate + Double(outputString)!
            }
            else if calculating == "-" {
                outputNumber = numberToCalculate - Double(outputString)!
            }
            else if calculating == "X" {
                outputNumber = numberToCalculate * Double(outputString)!
            }
            else if calculating == "/" {
                outputNumber = numberToCalculate / Double(outputString)!
            }
            equalSymbolPressed()
            
        }
        else if (outputString == "0") && (keypadInput != ".") {
            outputString = "" + keypadInput
        }
        else {
            outputString += keypadInput
        }
        display()
    }
    func reset() {
        calculating = ""
        outputNumber = 0
        outputString = "0"
        
        
        display()
    }
    func display() {
        outputLabel.text = outputString
    }
    func mathSymbolsPressed() {
        numberToCalculate = Double(outputString)!
        outputString = "0"
        outputNumber = 0
    }
    func equalSymbolPressed() {
        print("Calculating... \(numberToCalculate) + \(outputString)")
        outputString = String(outputNumber)
        if outputString.characters.suffix(2).first == "." {
            outputString = String(outputString.characters.dropLast(2))
        }
        calculating = ""
        display()
    }
}

