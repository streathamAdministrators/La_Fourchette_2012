
class Staff::KitchenController < ApplicationController
  
  layout 'waiters'
  
  def check_elements
    @elements = Element.all
    render :partial => "elements"
  end
  
  def index
    @elements = Element.all
  end
  
end
