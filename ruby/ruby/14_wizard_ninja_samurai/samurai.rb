require_relative 'human'
class Samurai < Human
    @@how_many = 0
    attr_accessor :strength, :intelligence, :stealth, :health
    def initialize
        @@how_many += 1
        @strength = 3
        @intelligence = 3
        @stealth = 175
        @health = 200
    end
    def death_blow(enemy)
        args = method(__method__).parameters.map { |arg| arg[1] }
        if enemy.class.ancestors.include?(Human)
            puts "Enemy Health 0 / Samurai attacking #{args} #{enemy.class} with Death Blow"
            enemy.health = 0
        else
            puts "#{args} #{enemy.class} is not a human."
        end
        self
    end
    def meditate
        self.health = 200
        puts "Health 200 / Samurai Meditate"
        self
    end
    def how_many
        puts "How many Samurais?"
        return @@how_many
    end
end

tom=Samurai.new
jerry=Human.new
legend=Samurai.new
p tom.death_blow(jerry).health
p jerry.health
p tom.attack(tom).health
p tom.meditate.health
p legend.how_many

# Enemy Health 0 / Samurai attacking [:enemy] Human with Death Blow
# 200
# 0
# Enemy Health -10 / Attacking the [:enemy]
# 190
# Health 200 / Samurai Meditate
# 200
# How many Samurais?
# 2