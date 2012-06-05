class Table < ActiveRecord::Base
  
<<<<<<< HEAD
  attr_accessible :is_active, :is_available, :nb_seat, :number_table, :restaurant_id, :employee_id
  
  belongs_to :restaurant, :class_name => 'Restaurant', :foreign_key => :restaurant_id
  belongs_to :employee, :class_name => 'Employee', :foreign_key => :employee_id
=======
  validates :is_active, :is_available, :nb_seat, :number_table, :employee_id, :restaurant_id, :presence => true
  
  belongs_to :restaurant
  belongs_to :employee
>>>>>>> 09660540827d373bf3bed5933fc66f691003d073
  
  has_many :orders
end
