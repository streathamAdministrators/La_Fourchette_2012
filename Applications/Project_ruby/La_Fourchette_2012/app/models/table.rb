class Table < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :employee
  
  has_many :orders
end
