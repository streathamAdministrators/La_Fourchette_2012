
class Staff::WaitersController < ApplicationController
  
  layout 'waiters'
  
  def check_orders
   @orders = Order.find_all_by_table_id_and_order_state_id(params[:table_id], 1)
   @elements = @orders.select {|k,v| k.order_id == @orders.id}
   render :partial => "orders"
  end
  
  def index
    @orders = Order.find_all_by_table_id_and_order_state_id(params[:table_id], 1)
    
    @elements = Array.new
    @product_types = ProductType.all
    @elements_test = Hash.new
    @elements_final = Hash.new
    
    
    @orders.each do |o|
      @elements = Array.new(Element.find_all_by_order_id(o.id))
      @product_types.each do |p|
        @elements_test[p] = @elements.select {|k,v| k.item.product_type_id = p.id}
      end
      #@elements_final[o] = @elements_test
    end
    
    
    
    logger.debug "The object is #{@elements_test}"
    logger.debug "The object orders is #{@orders}"
    
  end
  
  def table
    @tables = Table.all
    
    @tables_available = @tables.select {|k,v| k.is_available == true }
    @tables_not_available = @tables.select {|k,v| k.is_available == false }
    
    #@tables_available = @tables.is_available
  end
  
end
