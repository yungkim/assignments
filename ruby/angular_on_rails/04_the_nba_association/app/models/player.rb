class Player < ActiveRecord::Base
    belongs_to :team
    validates :first_name, :last_name, length: { in: 2..50 }
  before_save do
    self.first_name.capitalize!
    self.last_name.capitalize!
  end
end
