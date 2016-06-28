class Team < ActiveRecord::Base
    has_many :players
    validates :name, length: { in: 2..50 }
end
