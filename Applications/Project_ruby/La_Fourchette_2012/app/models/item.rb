class Item < ActiveRecord::Base
  belongs_to :product_type
  
  has_and_belongs_to_many :meals
end
