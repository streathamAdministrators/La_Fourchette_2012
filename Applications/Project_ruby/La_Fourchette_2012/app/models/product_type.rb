class ProductType < ActiveRecord::Base
  
  validates :name, :presence => true
  validates :name, :length => { :minimum => 3, :maximum => 30 }
  
  has_many :items
end
