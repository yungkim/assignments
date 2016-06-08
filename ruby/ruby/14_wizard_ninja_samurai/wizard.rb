require_relative 'human'
class Wizard < Human
    attr_accessor :strength, :intelligence, :stealth, :health
    def initialize
        @strength = 3
        @intelligence = 25
        @stealth = 175
        @health = 50
    end
    def heal
        self.health += 10
        puts "Health +10 / Wizard Heal"
        self
    end
    def fireball(enemy)
        args = method(__method__).parameters.map { |arg| arg[1] }
        if enemy.class.ancestors.include?(Human)
            puts "Health -20 / Wizard attacking the #{args} #{enemy.class} with fireball"
            enemy.health -= 20
        else
            puts "#{args} is not a human."
        end
        self
    end
end

wiz=Wizard.new
puts wiz.heal.fireball(wiz).health

# Health +10 / Wizard Heal
# Health -20 / Wizard attacking the [:enemy] Wizard with fireball
# 40