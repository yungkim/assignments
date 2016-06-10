class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => 'User'
end

# 2.2.4 :061 > User.all
#   User Load (0.2ms)  SELECT "users".* FROM "users"
# +----+------------+-----------+-------------------------+-------------------------+
# | id | first_name | last_name | created_at              | updated_at              |
# +----+------------+-----------+-------------------------+-------------------------+
# | 1  | Michael    | Jordan    | 2016-06-10 02:22:54 UTC | 2016-06-10 02:22:54 UTC |
# | 2  | Kobe       | Bryant    | 2016-06-10 02:23:29 UTC | 2016-06-10 02:23:29 UTC |
# | 3  | Jimmy      | Jones     | 2016-06-10 02:27:06 UTC | 2016-06-10 02:27:06 UTC |
# +----+------------+-----------+-------------------------+-------------------------+
# 3 rows in set

# 2.2.4 :062 > Friendship.all
#   Friendship Load (0.2ms)  SELECT "friendships".* FROM "friendships"
# +----+---------+-----------+-------------------------+-------------------------+
# | id | user_id | friend_id | created_at              | updated_at              |
# +----+---------+-----------+-------------------------+-------------------------+
# | 1  | 1       | 2         | 2016-06-10 02:25:52 UTC | 2016-06-10 02:25:52 UTC |
# | 2  | 2       | 1         | 2016-06-10 02:26:18 UTC | 2016-06-10 02:26:18 UTC |
# +----+---------+-----------+-------------------------+-------------------------+
# 2 rows in set

# User.first.friends should display all the friend information of the first user (this should include the first name and last name of all the friends of User.first).
# 2.2.4 :063 > User.first.friends
#   User Load (0.2ms)  SELECT  "users".* FROM "users"  ORDER BY "users"."id" ASC LIMIT 1
#   User Load (0.1ms)  SELECT "users".* FROM "users" INNER JOIN "friendships" ON "users"."id" = "friendships"."friend_id" WHERE "friendships"."user_id" = ?  [["user_id", 1]]
# +----+------------+-----------+-------------------------+-------------------------+
# | id | first_name | last_name | created_at              | updated_at              |
# +----+------------+-----------+-------------------------+-------------------------+
# | 2  | Kobe       | Bryant    | 2016-06-10 02:23:29 UTC | 2016-06-10 02:23:29 UTC |
# +----+------------+-----------+-------------------------+-------------------------+
# 1 row in set

# => how you can retrieve all users who are NOT a friend with the first User.
# 2.2.4 :060 > User.where.not(id:User.first.friends.select('id'))
#   User Load (0.2ms)  SELECT  "users".* FROM "users"  ORDER BY "users"."id" ASC LIMIT 1
#   User Load (0.2ms)  SELECT "users".* FROM "users" WHERE ("users"."id" NOT IN (SELECT "users"."id" FROM "users" INNER JOIN "friendships" ON "users"."id" = "friendships"."friend_id" WHERE "friendships"."user_id" = ?))  [["user_id", 1]]
# +----+------------+-----------+-------------------------+-------------------------+
# | id | first_name | last_name | created_at              | updated_at              |
# +----+------------+-----------+-------------------------+-------------------------+
# | 1  | Michael    | Jordan    | 2016-06-10 02:22:54 UTC | 2016-06-10 02:22:54 UTC |
# | 3  | Jimmy      | Jones     | 2016-06-10 02:27:06 UTC | 2016-06-10 02:27:06 UTC |
# +----+------------+-----------+-------------------------+-------------------------+
# 2 rows in set