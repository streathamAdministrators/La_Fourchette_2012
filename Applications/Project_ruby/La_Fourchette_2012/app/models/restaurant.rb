class Restaurant < ActiveRecord::Base
  has_many :tables
  has_many :employees
end
