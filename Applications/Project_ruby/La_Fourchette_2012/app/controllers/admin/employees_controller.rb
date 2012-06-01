class Admin::EmployeesController < ApplicationController
  layout 'admin'
  # GET /admin/employees
  # GET /admin/employees.json
  def index
    @admin_employees = Employee.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_employees }
    end
  end

  # GET /admin/employees/1
  # GET /admin/employees/1.json
  def show
    @admin_employee = Employee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_employee }
    end
  end

  # GET /admin/employees/new
  # GET /admin/employees/new.json
  def new
    @admin_employee = Employee.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_employee }
    end
  end

  # GET /admin/employees/1/edit
  def edit
    @admin_employee = Employee.find(params[:id])
  end

  # POST /admin/employees
  # POST /admin/employees.json
  def create
    @admin_employee = Employee.new(params[:admin_employee])

    respond_to do |format|
      if @admin_employee.save
        format.html { redirect_to @admin_employee, notice: 'Employee was successfully created.' }
        format.json { render json: @admin_employee, status: :created, location: @admin_employee }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/employees/1
  # PUT /admin/employees/1.json
  def update
    @admin_employee = Employee.find(params[:id])

    respond_to do |format|
      if @admin_employee.update_attributes(params[:admin_employee])
        format.html { redirect_to @admin_employee, notice: 'Employee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/employees/1
  # DELETE /admin/employees/1.json
  def destroy
    @admin_employee = Employee.find(params[:id])
    @admin_employee.destroy

    respond_to do |format|
      format.html { redirect_to admin_employees_url }
      format.json { head :no_content }
    end
  end
end
