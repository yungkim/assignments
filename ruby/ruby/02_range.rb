x = (1..5)
puts "x = (1..5)"
puts "Class Name: #{x.class}"
puts "Does it include 2? Yes, it does." if x.include? 2
puts "Is 5 a member? Yes, it is." if x.member? 5
puts "Last is #{x.last}"
puts "Max is #{x.max}"
puts "Min is #{x.min}"