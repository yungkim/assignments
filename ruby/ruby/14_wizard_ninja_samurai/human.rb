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
        if enemy.class.ancestors.include?(Human)
            puts "Enemy Health -10 / Attacking the #{args}"   
            enemy.health -= 10
        else
            puts "#{args} is not a human."
        end
        self
    end
end