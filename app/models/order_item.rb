class OrderItem < ActiveRecord::Base
  attr_accessible :description, :food_id, :user_name
  belongs_to :food
end
