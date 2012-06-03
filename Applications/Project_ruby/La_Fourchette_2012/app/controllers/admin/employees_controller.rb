class Admin::EmployeesController < ApplicationController
  layout 'admin'
  # GET /admin/employees
  # GET /admin/employees.json
  def index
    @employees = Employee.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employees }
    end
  end

  # GET /admin/employees/1
  # GET /admin/employees/1.json
  def show
    if params[:id] != nil
    @employee = Employee.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @employee }
      end
    elsif params[:restaurant_id] != nil
      #restaurant = Restaurant.find(params[:restaurant_id])
      @employees = Employee.find_all_by_restaurant_id(params[:restaurant_id])
      logger.debug "The object is #{@employees}"
      #params[:restaurant_id] = @employees
        respond_to do |format|
          format.html { render "restaurant_employees"}
          format.json { render json: @employees }
        end
    end

    
  end
  
  def employee_by_restauration
    @employees = Employee.find_by_restaurant(params[:restaurant])
    render :action => 'index'
  end

  # GET /admin/employees/new
  # GET /admin/employees/new.json
  def new
    @employee = Employee.new
    @restaurant = Restaurant.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @employee }
    end
  end

  # GET /admin/employees/1/edit
  def edit
    @employee = Employee.find(params[:id])
    @restaurant = Restaurant.all
  end

  # POST /admin/employees
  # POST /admin/employees.json
  def create
    @employee = Employee.new(params[:employee])

    respond_to do |format|
      if @employee.save
        format.html { redirect_to admin_employee_path(@employee), notice: 'Employee was successfully created.' }
        format.json { render json: @employee, status: :created, location: @employee }
      else
        format.html { render action: "new" }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/employees/1
  # PUT /admin/employees/1.json
  def update
    @employee = Employee.find(params[:id])

    respond_to do |format|
      if @employee.update_attributes(params[:employee])
        format.html { redirect_to admin_employee_path(@employee), notice: 'Employee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/employees/1
  # DELETE /admin/employees/1.json
  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to admin_employees_url }
      format.json { head :no_content }
    end
  end
end
