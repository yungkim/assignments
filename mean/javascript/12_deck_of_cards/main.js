// Assignment IV: Deck of Cards
// MandatoryDeadline: Tuesday of Week 1Difficulty Level: IntermediateEstimated Time: 2-4 hrs
// Create a Deck object constructor. A deck should have the following functionality:

// The Deck should contain the 52 standard cards
// The Deck should be able to shuffle
// The Deck should be able to reset
// The Deck should be able to deal a random card
// Deal should return the card that was dealt and remove it from the deck
// Now create a Player object constructor. A Player should have the following functionality:

// The Player should have a name
// The Player should have a hand
// The Player should be able to take a card (use the deck.deal method)
// The Player should be able to discard a card
// Optional:

// Create a blackjack game with your deck of cards!
// A deck of card image set can be found here

// Or unicode them Unicode for card images!

function Deck(){
    this.buildDeck();
}

function Card(value, suit){
  this.value = value;
  this.suit = suit;
}

function Player(name){
  this.name = name;
  this.hand = [];
}

Deck.prototype.buildDeck = function(){
    //https://en.wikipedia.org/wiki/Playing_cards_in_Unicode
  var suits = ['\u2666', '\u2663', '\u2665', '\u2660'],
      values = ['ace','2','3','4','5','6','7','8','9','10','jack','queen','king'],
  // var suits = ['diamonds', 'clubs', 'hearts', 'spades'],
  //     values = ['ace','2','3','4','5','6','7','8','9','10','jack','queen','king'],
      // Capture snapshot of this for use in callback function
      self = this;

  // Set up cards in deck as empty array
  this.cards = [];
  // Nested for loops iterate over suits and values to create new cards
  suits.forEach(function(suit){
    values.forEach(function(value){
      self.cards.push(new Card(value, suit));
    });
  });
  return this;
}

Deck.prototype.shuffle = function(){
  // Used https://bost.ocks.org/mike/shuffle/ to build shuffle logic
  var unshuffledEdge = this.cards.length,
      cardToShuffleIdx,
      temp;

  // While there remain elements to shuffle…
  while (unshuffledEdge > 0) {
    // Pick an element in the unshuffled portion…
    cardToShuffleIdx = Math.floor(Math.random() * unshuffledEdge);
    // Move the unshuffledEdge closer to front of array
    unshuffledEdge -= 1;

    // And swap the chosen card to the back
    temp = this.cards[cardToShuffleIdx]
    this.cards[cardToShuffleIdx] = this.cards[unshuffledEdge]
    this.cards[unshuffledEdge] = temp;
  }
  return this
}

Deck.prototype.reset = function(){
  this.buildDeck().shuffle();
}

Deck.prototype.dealRandomCard = function(){
  return (this.cards.length > 0) ? this.cards.pop() : null;
}

Player.prototype.takeCard = function(deck){
  // Method recieves a deck, and pulls a card from the deck to add to player's hand
  this.hand.push(deck.dealRandomCard());
  return this;
}

Player.prototype.discard = function(cardIdx){
  // Method recieves a location of the card to remove and deletes it from player's hand.
  if (this.hand.length > cardIdx){
    this.hand.splice(cardIdx, 1);
  }
  return this;
}


var c = new Deck()
c.shuffle()
console.log(c.dealRandomCard())

var p = new Player("Charlie")
console.log(p.takeCard(c).takeCard(c).takeCard(c))
console.log(p.discard(1))

// [nodemon] starting `node main.js`
// Card { value: '6', suit: 'diamonds' }
// Player {
//   name: 'Charlie',
//   hand:
//    [ Card { value: '7', suit: 'spades' },
//      Card { value: '3', suit: 'diamonds' },
//      Card { value: '5', suit: 'hearts' } ] }
// Player {
//   name: 'Charlie',
//   hand:
//    [ Card { value: '7', suit: 'spades' },
//      Card { value: '5', suit: 'hearts' } ] }
// [nodemon] clean exit - waiting for changes before restart