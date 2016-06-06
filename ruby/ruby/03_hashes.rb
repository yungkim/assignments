x = {:first_name => "John", :last_name => "Doe"}
puts x # {:first_name=>"John", :last_name=>"Doe"}
x.delete(:last_name) # => deletes and returns a value associated with the key
puts x # {:first_name=>"John"}
puts x.has_key? :first_name # true
puts x.has_value? "John" # true
puts x.empty? # false => returns true if hash contains no key-value pairs