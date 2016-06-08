class Human
    attr_accessor :strength, :intelligence, :stealth, :health
    def initialize
        @strength = 3
        @intelligence = 3
        @stealth = 3
        @health = 100
    end
    def attack(enemy)
        args = method(__method__).parameters.map { |arg| arg[1] }
        if enemy.class == Human
            puts "attacking the #{args}"   
            enemy.health -= 5
        else
            puts "#{args} is not a human."
        end
    end
end

class Test
end

man=Human.new
woman=Human.new
non_human=Test.new
puts woman.attack(man)
puts man.attack(non_human)

# attacking the [:enemy]
# 95
# [:enemy] is not a human.