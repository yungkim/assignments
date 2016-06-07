class Mammal
    attr_accessor :health
    def initialize
        @health = 100
    end
    def DisplayHealth
        puts "Health of Mammal: %s" % @health
    end
end