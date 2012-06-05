class Admin::TablesController < ApplicationController
  
  #before_filter :login_required, :except => [:create] 
  layout 'admin'
  
  # GET /admin/tables
  # GET /admin/tables.json
  def index
    @tables = Table.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tables }
    end
  end

  # GET /admin/tables/1
  # GET /admin/tables/1.json
  def show
    @table = Table.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @table }
    end
  end

  # GET /admin/tables/new
  # GET /admin/tables/new.json
  def new
    @table = Table.new
    @restaurant = Restaurant.all
    @employee = Employee.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @table }
    end
  end

  # GET /admin/tables/1/edit
  def edit
    @table = Table.find(params[:id])
    @restaurant = Restaurant.all
    @employee = Employee.all
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @table }
    end
  end

  # POST /admin/tables
  # POST /admin/tables.json
  def create
    @table = Table.new(params[:table])
    @restaurant = Restaurant.all
    @employee = Employee.all

    respond_to do |format|
      if @table.save
        format.html { redirect_to admin_table_path(@table), notice: 'Table was successfully created.' }
        format.json { render json: @table, status: :created, location: @table }
      else
        format.html { render action: "new" }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/tables/1
  # PUT /admin/tables/1.json
  def update
    @table = Table.find(params[:id])

    respond_to do |format|
      if @table.update_attributes(params[:table])
        format.html { redirect_to admin_table_path(@table), notice: 'Table was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  def desactivate 
      @table = Table.find(params[:id])
      @table.update_attributes :is_active => false
    
      respond_to do |format|
        format.html { redirect_to admin_tables_url }
        format.json { head :no_content }
      end
    end

    def activate 
      @table = Table.find(params[:id])
      @table.update_attributes :is_active => true
      
      respond_to do |format|
        format.html { redirect_to admin_tables_url }
        format.json { head :no_content }
      end
    end
end
