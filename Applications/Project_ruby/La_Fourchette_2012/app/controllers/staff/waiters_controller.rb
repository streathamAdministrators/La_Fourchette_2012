
class Staff::WaitersController < ApplicationController
  
  layout 'waiters'
  
  def check_orders
   @orders = Order.find_all_by_table_id_and_order_state_id(params[:table_id], 1)
   @elements = @orders.select {|k,v| k.order_id == @orders.id}
   render :partial => "orders"
  end
  
  def index
    @orders = Order.find_all_by_table_id_and_order_state_id(params[:table_id], 1)
    @elements = @orders.select {|k,v| k.elements == @orders.id}
    logger.debug "The object is #{@elements}"
  end
  
  def table
    @tables = Table.all
    
    @tables_available = @tables.select {|k,v| k.is_available == true }
    @tables_not_available = @tables.select {|k,v| k.is_available == false }
    
    #@tables_available = @tables.is_available
  end
  
end
