class Restaurant < ActiveRecord::Base
  
  validates :city, :name, :presence => true
  validates :city, :name, :length => { :minimum => 3, :maximum => 30 }
  
  has_many :tables
  has_many :employees
end
