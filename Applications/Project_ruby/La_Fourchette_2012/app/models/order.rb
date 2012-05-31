class Order < ActiveRecord::Base
  belongs_to :table
  belongs_to :order_state
  
  has_many :element
end
