require_relative 'mammal'

class Dog < Mammal #inherits from the Mammal class
    def initialize
        @health = 150
    end
    def pet
        @health += 5
        puts "Health +5 / Pet"
        self
    end
    def walk 
        @health -= 1
        puts "Health -1 / Walk"
        self
    end
    def run
        @health -= 10
        puts "Health -10 / Run"
        self
    end
    def DisplayHealth
        puts "Health of Dog: %s" % @health
    end
end

jindo = Dog.new
jindo.walk.walk.walk.run.run.pet.DisplayHealth

# Health -1 / Walk
# Health -1 / Walk
# Health -1 / Walk
# Health -10 / Run
# Health -10 / Run
# Health +5 / Pet
# Health of Dog: 132