//First, create a class called Animal
//
//Give Animal a property "name"
//Give Animal a property "health" with a default value of 100
//Give Animal an initialization that takes in a name and sets the name property appropriately
//Give the animal a displayHealth method

class Animal {
    var health: Int = 100
    var name: String
    init(name: String) {
        self.name = name
    }
    func displayHealth() {
        print("\(self.name) has \(self.health) health.")
    }
}

//Next, create a subclass of Animal called Cat
//
//Give the Cat a method "growl" that prints to the screen "Rawr!"
//Modify the Cat's health to be 150
//Give the Cat a method "run" that prints to the screen "Running" and deducts 10 health
class Cat: Animal {
    override init(name: String) {
        super.init(name: name)
        super.health = 150
    }
    func growl() {
        print("Rawr!")
    }
    func run() {
        print("Running")
        health -= 10
    }
}

let kitty=Cat(name: "Kitty")
kitty.growl()
kitty.run()
kitty.displayHealth()

//Next, create two subclasses of Cat - Cheetah and Lion
//
//Override the growl method of the Lion to make it print "ROAR!!!! I am the King of the Jungle"
//Override Lion's health to be 200
//Override the Cheetah's run method to print "Running Fast" and deduct 50 health
//Add a sleep function to the Cheetah class that adds 50 health (make sure that the Cheetah's health limit remains 200)

class Cheetah: Cat {
    override init(name: String) {
        super.init(name: name)
        super.health = 150
    }
    override func run() {
        print("Running Fast")
        if health <= 50 {
            print("Cannot run. Not enough health left")
        } else {
            health -= 50
        }
    }
    func sleep() {
        health += 50
        if health < 200 {
            health = 200
        }
    }
}


class Lion: Cat {
    override init(name: String) {
        super.init(name: name)
        super.health = 200
    }
    override func growl() {
        print("ROAR!!!! I am the King of the Jungle")
    }
}

//Create a Cheetah. Have the Cheetah run 4 times. Display the Cheetah's health. Now modify the Cat's run method so that it cannot run if it does not have the required health.
let c=Cheetah(name: "Chester")
c.run()
c.run()
c.run()
c.displayHealth()
c.sleep()
c.displayHealth()

//Create a Lion. Have the Lion run 3 times. Have the Lion growl.
let l=Lion(name: "King")
l.run()
l.run()
l.run()
l.growl()
l.displayHealth()
