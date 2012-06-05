
class Staff::WaitersController < ApplicationController
  
  def check_orders
   @data = Employee.all
   render :partial => "orders"
  end
  
  def index
    @data = Employee.all
  end
  
end
