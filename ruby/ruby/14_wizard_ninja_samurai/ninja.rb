require_relative 'human'
class Ninja < Human
    attr_accessor :strength, :intelligence, :stealth, :health
    def initialize
        @strength = 3
        @intelligence = 3
        @stealth = 175
        @health = 100
    end
    def steal(enemy)
        args = method(__method__).parameters.map { |arg| arg[1] }
        if enemy.class.ancestors.include?(Human)
            puts "Health +10 / Ninja attacking and stealing from the #{args} #{enemy.class}"
            attack(enemy)
            self.health += 10
        else
            puts "#{args} #{enemy.class} is not a human."
        end
        self
    end
    def get_away
        self.health -= 15
        puts "Health -15 / Ninja Get Away"
        self
    end
end

turtle=Ninja.new
pig=Ninja.new
p turtle.steal(pig).get_away.health
p pig.health

# Health +10 / Ninja attacking and stealing from the [:enemy] Ninja
# Enemy Health -10 / Attacking the [:enemy]
# Health -15 / Ninja Get Away
# 95
# 90