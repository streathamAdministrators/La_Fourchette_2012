
class Staff::KitchensController < ApplicationController
  
  layout 'waiters'
  
  def check_elements
    elements = Element.all
    
    @elements_envoye = elements.select {|k,v| k.element_state_id == 2}
    @elements_accepte = elements.select {|k,v| k.element_state_id == 3}
    
    render :partial => "elements"
  end
  
  def index
    elements = Element.all
    
    @elements_envoye = elements.select {|k,v| k.element_state_id == 2}
    @elements_accepte = elements.select {|k,v| k.element_state_id == 3}
  end
  
  def accept 
      @element = Element.find(params[:id])
      @element.update_attribute(:element_state_id, 3)
      
      respond_to do |format|
        format.html { redirect_to staff_element_index_path }
        format.json { head :no_content }
      end
  end
  
  def cooked 
      @element = Element.find(params[:id])
      @element.update_attribute(:element_state_id, 4)
      
      respond_to do |format|
        format.html { redirect_to staff_element_index_path }
        format.json { head :no_content }
      end
  end
  
end
