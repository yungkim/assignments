//
//  ViewController.swift
//  05_ttt
//
//  Created by Yung Kim on 7/7/16.
//  Copyright © 2016 Yung Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var gridButton1: UIButton!
    @IBOutlet weak var gridButton2: UIButton!
    @IBOutlet weak var gridButton3: UIButton!
    @IBOutlet weak var gridButton4: UIButton!
    @IBOutlet weak var gridButton5: UIButton!
    @IBOutlet weak var gridButton6: UIButton!
    @IBOutlet weak var gridButton7: UIButton!
    @IBOutlet weak var gridButton8: UIButton!
    @IBOutlet weak var gridButton9: UIButton!
    var gameBoard = [0,0,0,
                     0,0,0,
                     0,0,0]
    var turn = 1
    var gameover = false
    var counter_red = 0
    var counter_blue = 0
    var counter_draw = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        reset()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func gridButtonPressed(sender: UIButton) {
        if (gameBoard[sender.tag-1] != 0) && !gameover {
            return
        }
        print(sender.tag)
        if (gameover == true) {
            reset()
        }
        turn += 1
        if (sender.tag == 1) {
            if (turn % 2 == 0) {
                gridButton1.backgroundColor = UIColor.redColor()
                gameBoard[0] = 1
            } else {
                gridButton1.backgroundColor = UIColor.blueColor()
                gameBoard[0] = 2
            }
        }
        if (sender.tag == 2) {
            if (turn % 2 == 0) {
                gridButton2.backgroundColor = UIColor.redColor()
                gameBoard[1] = 1
            } else {
                gridButton2.backgroundColor = UIColor.blueColor()
                gameBoard[1] = 2
            }
        }
        if (sender.tag == 3) {
            if (turn % 2 == 0) {
                gridButton3.backgroundColor = UIColor.redColor()
                gameBoard[2] = 1
            } else {
                gridButton3.backgroundColor = UIColor.blueColor()
                gameBoard[2] = 2
            }
        }
        if (sender.tag == 4) {
            if (turn % 2 == 0) {
                gridButton4.backgroundColor = UIColor.redColor()
                gameBoard[3] = 1
            } else {
                gridButton4.backgroundColor = UIColor.blueColor()
                gameBoard[3] = 2
            }
        }
        if (sender.tag == 5) {
            if (turn % 2 == 0) {
                gridButton5.backgroundColor = UIColor.redColor()
                gameBoard[4] = 1
            } else {
                gridButton5.backgroundColor = UIColor.blueColor()
                gameBoard[4] = 2
            }
        }
        if (sender.tag == 6) {
            if (turn % 2 == 0) {
                gridButton6.backgroundColor = UIColor.redColor()
                gameBoard[5] = 1
            } else {
                gridButton6.backgroundColor = UIColor.blueColor()
                gameBoard[5] = 2
            }
        }
        if (sender.tag == 7) {
            if (turn % 2 == 0) {
                gridButton7.backgroundColor = UIColor.redColor()
                gameBoard[6] = 1
            } else {
                gridButton7.backgroundColor = UIColor.blueColor()
                gameBoard[6] = 2
            }
        }
        if (sender.tag == 8) {
            if (turn % 2 == 0) {
                gridButton8.backgroundColor = UIColor.redColor()
                gameBoard[7] = 1
            } else {
                gridButton8.backgroundColor = UIColor.blueColor()
                gameBoard[7] = 2
            }
        }
        if (sender.tag == 9) {
            if (turn % 2 == 0) {
                gridButton9.backgroundColor = UIColor.redColor()
                gameBoard[8] = 1
            } else {
                gridButton9.backgroundColor = UIColor.blueColor()
                gameBoard[8] = 2
            }
        }
        if (
            (((gameBoard[0], gameBoard[1]) == (gameBoard[1], gameBoard[2])) && (gameBoard[0] != 0))
            || (((gameBoard[3], gameBoard[4]) == (gameBoard[4], gameBoard[5])) && (gameBoard[3] != 0))
            || (((gameBoard[6], gameBoard[7]) == (gameBoard[7], gameBoard[8])) && (gameBoard[6] != 0))
            
            || (((gameBoard[0], gameBoard[3]) == (gameBoard[3], gameBoard[6])) && (gameBoard[0] != 0))
            || (((gameBoard[1], gameBoard[4]) == (gameBoard[4], gameBoard[7])) && (gameBoard[1] != 0))
            || (((gameBoard[2], gameBoard[5]) == (gameBoard[5], gameBoard[8])) && (gameBoard[2] != 0))
            
            || (((gameBoard[0], gameBoard[4]) == (gameBoard[4], gameBoard[8])) && (gameBoard[0] != 0))
            || (((gameBoard[2], gameBoard[4]) == (gameBoard[4], gameBoard[6])) && (gameBoard[2] != 0))
            ) {
            if (gameBoard[sender.tag-1] == 1) {
                counter_red += 1
                winnerLabel.text = "Red Wins! x \(counter_red)"
                gameover = true
            }
            else if (gameBoard[sender.tag-1] == 2) {
                counter_blue += 1
                winnerLabel.text = "Blue Wins! x \(counter_blue)"
                gameover = true
            }
            winnerLabel.hidden = false
        }
        if ((gameBoard.indexOf(0) == nil) && !gameover) {
            counter_draw += 1
            winnerLabel.text = "Draw! x \(counter_draw)"
            gameover = true
            winnerLabel.hidden = false
        }
        print(gameBoard)
    }
    @IBAction func resetButtonPressed(sender: AnyObject) {
        reset()
    }
    func reset() {
        winnerLabel.hidden = true
        gameover = false
        gameBoard = [0,0,0,
                     0,0,0,
                     0,0,0]
        gridButton1.backgroundColor = UIColor.grayColor()
        gridButton2.backgroundColor = UIColor.grayColor()
        gridButton3.backgroundColor = UIColor.grayColor()
        gridButton4.backgroundColor = UIColor.grayColor()
        gridButton5.backgroundColor = UIColor.grayColor()
        gridButton6.backgroundColor = UIColor.grayColor()
        gridButton7.backgroundColor = UIColor.grayColor()
        gridButton8.backgroundColor = UIColor.grayColor()
        gridButton9.backgroundColor = UIColor.grayColor()
    }
}

