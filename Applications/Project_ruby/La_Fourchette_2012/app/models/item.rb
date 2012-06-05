class Item < ActiveRecord::Base
  
  validates :is_active, :name, :description, :price, :time, :product_type_id, :presence => true
  validates :name, :length => { :minimum => 3, :maximum => 30 }
  validates :description, :length => { :minimum => 15, :maximum => 140 }
  
  belongs_to :product_type, :class_name => 'ProductType', :foreign_key => :product_type_id
  
  has_and_belongs_to_many :meals
end
