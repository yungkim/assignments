//Create a function tossCoin() -> String
//Have this function print "Tossing a Coin!"
//Next have the function randomly pick either "Heads" or "Tails"
//Have the function print the result
//Finally, have the function return the result
import Foundation

func tossCoin() -> String {
    print("Tossing a Coin!")
    var result: String = ""
    let randomNumber = Int(arc4random_uniform(2))
    if randomNumber == 1 {
        result = "Heads"
        print("Heads")
    } else {
        result = "Tails"
        print("Tails")
    }
    return result
}

tossCoin()


//Now create another function tossMultipleCoins(Int) -> Double
//Have this function call the tossCoin function multiple times based on the Integer input
//Have the function return a Double that reflects the ratio of head toss to total toss
func tossMultipleCoins(times: Int) -> Double {
    var heads: Double = 0
    var tails: Double = 0
    for _ in 0...times {
        if tossCoin() == "Heads" {
            heads += 1
        } else {
            tails += 1
        }
    }

    return heads/tails
}

tossMultipleCoins(100)