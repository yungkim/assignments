class Product < ActiveRecord::Base
    belongs_to :category
    validates :name, :description, :pricing, presence: :true
end
