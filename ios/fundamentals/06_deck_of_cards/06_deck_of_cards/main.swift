//
//  main.swift
//  06_deck_of_cards
//
//  Created by Yung Kim on 7/6/16.
//  Copyright © 2016 Yung Kim. All rights reserved.
//

import Foundation

//Create a struct called "Card"
//
//Give the Card struct a property "value" which will hold the value of the card (A, 2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K). This value should be a String
//Give the Card a property "Suit" which will hold the suit of the card (Clubs, Spades, Hearts, Clubs)
//Give the Card a property "numerical_value" which will hold the numerical value of the card 1-13

struct Card {
    let value: String
    let suit: String
    let numerical_value: Int
}

//Next, create a class called "Deck"
//
//Give the Deck class a property called "cards" of type [Card]
//When initializing the deck make sure that it has the 52 unique cards in its "cards" property
//Give the Deck a deal method that selects the "top-most" card, removes it, and returns it
//Give the Deck a reset method that resets the cards property to the contain the original 52 cards
//Give the Deck a shuffle method that randomly reorders the deck's cards

class Deck {
    var cards: [Card] = []
    init() {
        reset()
    }
    func reset() {
        let suits = ["Clubs", "Spades", "Hearts", "Diamonds"]
        let values = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
        for suit in suits {
            var numerical_value = 1
            for value in values {
                let card = Card(value: value, suit: suit, numerical_value: numerical_value)
                numerical_value += 1
                cards.append(card)
            }
        }
        print("New Deck of Cards!")
    }
    func deal() -> Card {
        let card = self.cards[0]
        self.cards.removeAtIndex(0)
        print("Dealing...")
        return card
    }
        func shuffle() {
        for _ in 0..<self.cards.count {
            let rand1 = Int(arc4random_uniform(UInt32(self.cards.count)))
            let rand2 = Int(arc4random_uniform(UInt32(self.cards.count)))
            let temp = self.cards[rand1]
            self.cards[rand1] = self.cards[rand2]
            self.cards[rand2] = temp
        }
        print("Shuffling...")
    }
}

//Finally, create a class called "Player"
//
//Give the Player class a name property
//Give the Player a hand property of type [Card]
//Give the Player a draw method of type (Deck) -> Card which draws a card from a deck, adds it to the players hand, and returns it
//Note how we are passing the Deck by reference here since it is a class.
//Give the Player a discard method of type (Card) -> Bool which discards the Card specified and returns True if the Card existed and was successfully removed or False if the Card was not in the player's hand.

class Player {
    let name: String
    var hand: [Card] = []
    let deck = Deck()
    init(name: String) {
        self.name = name
    }
    func draw() {
        deck.shuffle()
        hand.append(deck.cards[0])
        let card = deck.deal()
        print("\(self.name) drew a card and got the following card: \(card)")
    }
    func discard(card: Card) -> Bool {
        for h in 0..<self.hand.count {
            if (self.hand[h].numerical_value == card.numerical_value && self.hand[h].suit == card.suit) {
                print("Card found. Discarding the card.")
                self.hand.removeAtIndex(h)
                return true
            }
        }
        print("Card not found.")
        return false
    }
}
let p=Player(name: "John")
p.draw()
p.draw()
p.draw()
p.draw()
p.draw()
p.draw()
p.draw()
p.draw()
p.draw()
p.draw()
p.draw()
p.draw()
p.draw()
p.draw()
p.draw()
print(p.hand)
let new_card=Card(value: "K", suit: "Diamonds", numerical_value: 13)
p.discard(new_card)
print(p.hand)


//New Deck of Cards!
//Shuffling...
//Dealing...
//John drew a card and got the following card: Card(value: "10", suit: "Spades", numerical_value: 10)
//Shuffling...
//Dealing...
//John drew a card and got the following card: Card(value: "4", suit: "Hearts", numerical_value: 4)
//Shuffling...
//Dealing...
//John drew a card and got the following card: Card(value: "9", suit: "Clubs", numerical_value: 9)
//Shuffling...
//Dealing...
//John drew a card and got the following card: Card(value: "7", suit: "Spades", numerical_value: 7)
//Shuffling...
//Dealing...
//John drew a card and got the following card: Card(value: "6", suit: "Clubs", numerical_value: 6)
//Shuffling...
//Dealing...
//John drew a card and got the following card: Card(value: "J", suit: "Clubs", numerical_value: 11)
//Shuffling...
//Dealing...
//John drew a card and got the following card: Card(value: "J", suit: "Spades", numerical_value: 11)
//Shuffling...
//Dealing...
//John drew a card and got the following card: Card(value: "4", suit: "Clubs", numerical_value: 4)
//Shuffling...
//Dealing...
//John drew a card and got the following card: Card(value: "10", suit: "Diamonds", numerical_value: 10)
//Shuffling...
//Dealing...
//John drew a card and got the following card: Card(value: "Q", suit: "Hearts", numerical_value: 12)
//Shuffling...
//Dealing...
//John drew a card and got the following card: Card(value: "10", suit: "Hearts", numerical_value: 10)
//Shuffling...
//Dealing...
//John drew a card and got the following card: Card(value: "10", suit: "Clubs", numerical_value: 10)
//Shuffling...
//Dealing...
//John drew a card and got the following card: Card(value: "3", suit: "Spades", numerical_value: 3)
//Shuffling...
//Dealing...
//John drew a card and got the following card: Card(value: "6", suit: "Hearts", numerical_value: 6)
//Shuffling...
//Dealing...
//John drew a card and got the following card: Card(value: "K", suit: "Diamonds", numerical_value: 13)
//[_6_deck_of_cards.Card(value: "10", suit: "Spades", numerical_value: 10), _6_deck_of_cards.Card(value: "4", suit: "Hearts", numerical_value: 4), _6_deck_of_cards.Card(value: "9", suit: "Clubs", numerical_value: 9), _6_deck_of_cards.Card(value: "7", suit: "Spades", numerical_value: 7), _6_deck_of_cards.Card(value: "6", suit: "Clubs", numerical_value: 6), _6_deck_of_cards.Card(value: "J", suit: "Clubs", numerical_value: 11), _6_deck_of_cards.Card(value: "J", suit: "Spades", numerical_value: 11), _6_deck_of_cards.Card(value: "4", suit: "Clubs", numerical_value: 4), _6_deck_of_cards.Card(value: "10", suit: "Diamonds", numerical_value: 10), _6_deck_of_cards.Card(value: "Q", suit: "Hearts", numerical_value: 12), _6_deck_of_cards.Card(value: "10", suit: "Hearts", numerical_value: 10), _6_deck_of_cards.Card(value: "10", suit: "Clubs", numerical_value: 10), _6_deck_of_cards.Card(value: "3", suit: "Spades", numerical_value: 3), _6_deck_of_cards.Card(value: "6", suit: "Hearts", numerical_value: 6), _6_deck_of_cards.Card(value: "K", suit: "Diamonds", numerical_value: 13)]
//Card found. Discarding the card.
//[_6_deck_of_cards.Card(value: "10", suit: "Spades", numerical_value: 10), _6_deck_of_cards.Card(value: "4", suit: "Hearts", numerical_value: 4), _6_deck_of_cards.Card(value: "9", suit: "Clubs", numerical_value: 9), _6_deck_of_cards.Card(value: "7", suit: "Spades", numerical_value: 7), _6_deck_of_cards.Card(value: "6", suit: "Clubs", numerical_value: 6), _6_deck_of_cards.Card(value: "J", suit: "Clubs", numerical_value: 11), _6_deck_of_cards.Card(value: "J", suit: "Spades", numerical_value: 11), _6_deck_of_cards.Card(value: "4", suit: "Clubs", numerical_value: 4), _6_deck_of_cards.Card(value: "10", suit: "Diamonds", numerical_value: 10), _6_deck_of_cards.Card(value: "Q", suit: "Hearts", numerical_value: 12), _6_deck_of_cards.Card(value: "10", suit: "Hearts", numerical_value: 10), _6_deck_of_cards.Card(value: "10", suit: "Clubs", numerical_value: 10), _6_deck_of_cards.Card(value: "3", suit: "Spades", numerical_value: 3), _6_deck_of_cards.Card(value: "6", suit: "Hearts", numerical_value: 6)]
//Program ended with exit code: 0
