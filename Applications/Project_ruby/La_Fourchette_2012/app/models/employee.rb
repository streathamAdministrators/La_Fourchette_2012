class Employee < ActiveRecord::Base
  
  validates :password, :username, :restaurant_id, :presence => true
  
  has_many :tables
  belongs_to :restaurant, :class_name => 'Restaurant', :foreign_key => :restaurant_id
  
end
