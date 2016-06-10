class Dojo < ActiveRecord::Base
    has_many :ninjas
    validates :name, :city, presence: true
    validates :state, length: { minimum: 2 }
end

# ==> how to create 3 ninjas that belong to the each dojo.
# Dojo.first.ninjas.create(first_name:"Doctor", last_name:"Dre")
# Dojo.second.ninjas.create(first_name:"Doctor", last_name:"Dre")
# Dojo.last.ninjas.create(first_name:"Doctor", last_name:"Dre")

# ==> how to get all of the ninjas for any dojo (e.g. get all the ninjas for the first dojo, second dojo, etc).
# 2.2.4 :045 > Dojo.first.ninjas
#   Dojo Load (0.2ms)  SELECT  "dojos".* FROM "dojos"  ORDER BY "dojos"."id" ASC LIMIT 1
#   Ninja Load (0.2ms)  SELECT "ninjas".* FROM "ninjas" WHERE "ninjas"."dojo_id" = ?  [["dojo_id", 4]]
# +----+------------+-----------+---------+-------------------------+-------------------------+
# | id | first_name | last_name | dojo_id | created_at              | updated_at              |
# +----+------------+-----------+---------+-------------------------+-------------------------+
# | 1  | Michael    | Choi      | 4       | 2016-06-10 01:10:55 UTC | 2016-06-10 01:10:55 UTC |
# | 2  | Ninja      | Turtles   | 4       | 2016-06-10 01:11:32 UTC | 2016-06-10 01:11:32 UTC |
# | 3  | John       | Doe       | 4       | 2016-06-10 01:11:49 UTC | 2016-06-10 01:11:49 UTC |
# +----+------------+-----------+---------+-------------------------+-------------------------+
# 3 rows in set

# ==> How would you only retrieve the first_names of the ninja that belongs to the second dojo and order the result by created_at DESC order?
# 2.2.4 :064 > Dojo.second.ninjas.order('created_at DESC').select('first_name')
#   Dojo Load (0.2ms)  SELECT  "dojos".* FROM "dojos"  ORDER BY "dojos"."id" ASC LIMIT 1 OFFSET 1
#   Ninja Load (0.3ms)  SELECT "ninjas"."first_name" FROM "ninjas" WHERE "ninjas"."dojo_id" = ?  ORDER BY created_at DESC  [["dojo_id", 5]]
# +----+------------+
# | id | first_name |
# +----+------------+
# |    | Big        |
# |    | Michael    |
# |    | Star       |
# +----+------------+
# 3 rows in set