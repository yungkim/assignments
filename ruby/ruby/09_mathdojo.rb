class MathDojo
  attr_accessor :number
  def initialize
    @number = 0
    self
  end
  def add(*nums)
    nums.each do |num|
        if num.class == Array
            num.each do |arr_num|
                self.number += arr_num
            end
        else
            self.number += num
        end
    end
    self
  end
  def subtract(*nums)
    nums.each do |num|
        if num.class == Array
            num.each do |arr_num|
                self.number -= arr_num
            end
        else
            self.number -= num
        end
    end
    self
  end
  def result
    puts self.number
    self
  end
end

MathDojo.new.add(2).add(2, 5).subtract(3, 2).result
MathDojo.new.add(1).add([3, 5, 7, 8], [2, 4.3, 1.25]).subtract([2,3], [1.1, 2.3]).result 

# 4
# 23.15
