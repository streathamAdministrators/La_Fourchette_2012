class Employee < ActiveRecord::Base
  
  #Pour interdire toutes autres données que celles entrée ci-dessous.
  attr_accessible :username, :password, :password_confirmation, :restaurant_id
  attr_accessor :password
  
  before_save :encrypt_password
  
  validates :password, :username, :restaurant_id, :presence => true
  validates :password, :length => { :minimum => 6, :maximum => 30 }
  validates :password, :confirmation => true
  validates :password_confirmation, :presence => true
  
  has_many :tables
  belongs_to :restaurant, :class_name => 'Restaurant', :foreign_key => :restaurant_id
  
  def self.authenticate(username, password)
    employee = find_by_username(username)
    if employee && employee.password_hash == BCrypt::Engine.hash_secret(password, employee.password_salt)
      employee
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
