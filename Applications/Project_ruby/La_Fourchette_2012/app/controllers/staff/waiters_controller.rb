
class Staff::WaitersController < ApplicationController
  
  layout 'waiters'
  
  def check_orders
   @data = Employee.all
   render :partial => "orders"
  end
  
  def index
    @data = Employee.all
  end
  
  def table
    @tables = Table.all
  end
  
end
