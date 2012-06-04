class Meal < ActiveRecord::Base
  
  validates :is_active, :name, :price, :item_ids, :presence => true
  validates :name, :length => { :minimum => 3, :maximum => 30 }
  
  has_and_belongs_to_many :items
  
end
