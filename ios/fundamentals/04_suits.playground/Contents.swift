// Given the following three variables write a for-in loop that will have the following output in the Assistant Editor.
let suits = ["Clubs", "Diamonds", "Hearts", "Spades"]
let cards = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]

var deckOfCards = [String: [Int]]()

// your code here
var arr = [Int]()
//for i in 0..<suits.count
for suit in suits {
    arr=[]
    for card in cards {
        
        arr.append(card)
    }
    deckOfCards[suit] = arr
}
print(deckOfCards)



//Our result should look something like the following:
//
//["Clubs": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13], "Diamonds": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13], "Hearts": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13], "Spades": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]]

