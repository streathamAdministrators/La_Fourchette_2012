
class Staff::WaitersController < ApplicationController
  
  layout 'waiters'
  
  
  def check_orders
    get_all_orders_by_table
    render :partial => "orders"
  end
  
  
  def order
    get_all_orders_by_table
  end
  
  def get_all_orders_by_table
     @id = params[:table_id]
     orders = Order.find_all_by_table_id_and_order_state_id(@id, 1)

      elements = Array.new
      product_types = ProductType.all
      @elements_final = Hash.new


      orders.each do |o|
        elements = Array.new(Element.find_all_by_order_id(o.id))
        product_types.each do |p|
          elements_test = elements.select {|k,v| k.item.product_type.id == p.id}
          @elements_final[p.name] = elements_test
        end
      end
  end
  private :get_all_orders_by_table
  
  
  def table
    @tables = Table.all
    
    @tables_available = @tables.select {|k,v| k.is_available == true }
    @tables_not_available = @tables.select {|k,v| k.is_available == false }
    
  end
  
  
  def change_element_states
    id = params[:element_id]
    element = Element.find(id)
    if element.element_state.id == 1
      element.update_attribute(:element_state_id, 2)
    end
    
    #get the table Id
    table_id = element.order.table.id
    
    respond_to do |format|
      format.html{ redirect_to staff_order_path(table_id) }
    end
    
  end
  
end
