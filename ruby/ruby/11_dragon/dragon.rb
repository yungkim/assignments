require_relative 'mammal'

class Dragon < Mammal #inherits from the Mammal class
    def initialize
        @health = 170
    end
    def fly
        @health -= 10
        puts "Health -10 / Fy"
        self
    end
    def attack_town 
        @health -= 50
        puts "Health -50 / Attack Town"
        self
    end
    def eat_humans
        @health += 20
        puts "Health +20 / Eat Humans"
        self
    end
    def DisplayHealth
        puts "This is a dragon!"
        super
    end
end

puff = Dragon.new
puff.attack_town.attack_town.attack_town.eat_humans.eat_humans.fly.fly.DisplayHealth

# Health -50 / Attack Town
# Health -50 / Attack Town
# Health -50 / Attack Town
# Health +20 / Eat Humans
# Health +20 / Eat Humans
# Health -10 / Fy
# Health -10 / Fy
# This is a dragon!
# Health of Mammal: 40