require_relative 'my_enumerable'
class Array
   include MyEnumerable
end
[1,2,3,4].my_each { |i| puts i } #prints 1 2 3 4 in the terminal

# 1
# 2
# 3
# 4