class User < ActiveRecord::Base
    validates :email_address, presence: true
    validates_numericality_of :age, only_integer: true, greater_than: 9, less_than: 151 # allow_blank: true,
    validates :first_name, :last_name, length: { minimum: 2 }
end

# See if it allows you to insert some records when the fields are not meeting the validation rules we set (e.g. try to create a record where age is 5 or above 150, or where the first name is just one character, etc).
# Make sure your console returns appropriate error messages when you try to save something that's not meeting the validation rules.
# 2.2.4 :032 > test.errors.full_messages
#  => ["First name can't be blank", "First name is too short (minimum is 2 characters)", "Age must be less than 151"]

# Know how to retrieve all users.
# 2.2.4 :033 > User.all
#   User Load (0.3ms)  SELECT "users".* FROM "users"
# +----+------------+-----------+-------------------+-----+-------------------------+-------------------------+
# | id | first_name | last_name | email_address     | age | created_at              | updated_at              |
# +----+------------+-----------+-------------------+-----+-------------------------+-------------------------+
# | 1  | Jon        | Doe       | email@test.com    | 30  | 2016-06-09 22:15:26 UTC | 2016-06-09 22:15:26 UTC |
# | 2  | Kevin      | Johnson   | kevin@johnson.com | 22  | 2016-06-09 22:18:31 UTC | 2016-06-09 22:18:31 UTC |
# | 3  | FFF        | LLL\n     | test@tes.com      | 150 | 2016-06-09 22:34:52 UTC | 2016-06-09 22:50:10 UTC |
# +----+------------+-----------+-------------------+-----+-------------------------+-------------------------+
# 3 rows in set

# Know how to get the first user.
# => User.first

# Know how to get the last user.
# => User.last

# Know how to get the users sorted by their first name (order by first_name DESC).
# => User.order('first_name desc')

# See ordering rules and more here: http://guides.rubyonrails.org/active_record_querying.html#ordering
# Get the record of the user whose id is 3 and UPDATE the person's last_name to something else. Know how to do this directly in the console using .find and .save.
# User.update(3, :last_name => 'Kim')

# Know how to delete a record of a user whose id is 4 (use something like User.find(2).destroy...).
# => User.where(id: 4).destroy_all