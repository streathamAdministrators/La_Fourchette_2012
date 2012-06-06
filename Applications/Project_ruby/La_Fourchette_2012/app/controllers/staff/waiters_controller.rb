
class Staff::WaitersController < ApplicationController
  
  layout 'waiters'
  
  def check_orders
    
    get_all_orders_by_table
    render :partial => "orders"
  end
  
  def index
    
    get_all_orders_by_table
    
    logger.debug "The object is #{@elements_final}"
    logger.debug "The object orders is #{@orders}"
    
  end
  
  def get_all_orders_by_table
     @orders = Order.find_all_by_table_id_and_order_state_id(params[:table_id], 1)

      @elements = Array.new
      @product_types = ProductType.all
      @elements_final = Hash.new


      @orders.each do |o|
        @elements = Array.new(Element.find_all_by_order_id(o.id))
        @product_types.each do |p|
          @elements_test = @elements.select {|k,v| k.item.product_type.id == p.id}
          @elements_final[p.name] = @elements_test
        end
      end
  end
  
  private :get_all_orders_by_table
  
  def table
    @tables = Table.all
    
    @tables_available = @tables.select {|k,v| k.is_available == true }
    @tables_not_available = @tables.select {|k,v| k.is_available == false }
    
  end
  
end
