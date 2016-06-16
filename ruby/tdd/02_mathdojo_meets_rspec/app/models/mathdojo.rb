class Mathdojo < ActiveRecord::Base
 attr_accessor :result
 def initialize
  @result = 0
  @sum = 0
 end
 def add *numbers
  @result += numbers.flatten.inject(:+)
  return self
 end
 def subtract *numbers
  @result -= numbers.flatten.inject(:+)
  return self
 end
 def multiply_by_the_sum *numbers
  @result *= numbers.flatten.inject(:+)
  return self
 end
 def multiply *numbers
  @result *= numbers.flatten.inject(:*)
  return self
 end
 def reset
  @result = 1
  return self
 end
end
