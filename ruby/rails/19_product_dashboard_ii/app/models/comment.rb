class Comment < ActiveRecord::Base
  belongs_to :product
  validates :comment, presence: true
end
