class Table < ActiveRecord::Base
  
  attr_accessible :is_active, :is_available, :nb_seat, :number_table, :restaurant_id, :employee_id
  validates :is_active, :is_available, :nb_seat, :number_table, :employee_id, :restaurant_id, :presence => true
  
  belongs_to :restaurant, :class_name => 'Restaurant', :foreign_key => :restaurant_id
  belongs_to :employee, :class_name => 'Employee', :foreign_key => :employee_id
  
  has_many :orders
end
