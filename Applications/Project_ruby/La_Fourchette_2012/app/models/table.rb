class Table < ActiveRecord::Base
  
  validates :is_active, :is_available, :nb_seat, :number_table, :employee_id, :restaurant_id, :presence => true
  
  belongs_to :restaurant
  belongs_to :employee
  
  has_many :orders
end
