a = {:first_name => "Michael", :last_name => "Choi"}
b = {:first_name => "John", :last_name => "Supsupin"}
c = {:first_name => "KB", :last_name => "Tonel"}
d = {:first_name => "Jessie", :last_name => "De Leon"}
e = {:first_name => "Jaybee", :last_name => "Balog"}
names = [a, b, c, d, e]

print "You got ", names.count, " names in the 'names' array\n"

names.each do |val|
    print "The name is ' "
    val.each {|k,v| print v, " "}
    print "'\n"
end

# You got 5 names in the 'names' array
# The name is ' Michael Choi '
# The name is ' John Supsupin '
# The name is ' KB Tonel '
# The name is ' Jessie De Leon '
# The name is ' Jaybee Balog '