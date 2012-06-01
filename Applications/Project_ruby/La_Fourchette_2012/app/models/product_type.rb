class ProductType < ActiveRecord::Base
  has_many :items
end
