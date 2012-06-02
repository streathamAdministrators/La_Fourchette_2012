class JavascriptsController < ApplicationController
  
   def dynamic_employee
    @employee = Employee.find(:all)
    respond_to do |format|
      format.js {render :content_type => 'text/javascript'}
    end
  end

end
