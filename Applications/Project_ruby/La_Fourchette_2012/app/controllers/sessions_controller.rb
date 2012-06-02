
class SessionsController < ApplicationController
  def new
  end
  
  def create 
    employee = Employee.authenticate(params[:username], params[:password])
    if employee
      session[:employee_id] = employee.id
      redirect_to root_url, :notice => "logged in"
    else
      flash.now.alert = "Enter a valide username & password"
      render "new"
    end
  end
  
  def destroy
    session[:employee_id] = nil
    redirect_to root_url, :notice => "logged out"
  end
  
end
