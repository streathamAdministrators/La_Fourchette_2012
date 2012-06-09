
class Staff::BanksController < ApplicationController
  
  layout 'waiters'
  
  def check_payable_orders
    get_all_payable_order
    render :partial => "payable_orders"
  end
  
  def payable_order
    get_all_payable_order
  end
  
  def get_all_payable_order
    orders = Order.all
    @payable_order = orders.select {|k,v| k.order_state_id == 2}
  end
  private :get_all_payable_order
  
  def close_order
    id = params[:order_id]
    order = Order.find(id)
    order.update_attribute(:order_state_id, 3)
  end
  
end
