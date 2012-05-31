class Element < ActiveRecord::Base
  belongs_to :element_state
  belongs_to :order
  belongs_to :item
end
