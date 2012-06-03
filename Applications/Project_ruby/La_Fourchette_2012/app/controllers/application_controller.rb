class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_employee, :login_required
  
  private
  def current_employee
    @current_employee ||= Employee.find_by_id(session[:employee_id]) if session[(:employee_id)]
  end
  
  def login_required
    if session[:employee_id].nil?
      redirect_to login_path, :notice => "You are not logged"
    elsif Employee.find_by_id(session[:employee_id]).nil?
      redirect_to login_path, :notice => "No user corresponding in database"
      return nil
    end
  end
end
