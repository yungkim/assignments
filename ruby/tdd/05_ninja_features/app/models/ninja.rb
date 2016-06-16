class Ninja < ActiveRecord::Base
    validates :name, :description, presence: true;
end
