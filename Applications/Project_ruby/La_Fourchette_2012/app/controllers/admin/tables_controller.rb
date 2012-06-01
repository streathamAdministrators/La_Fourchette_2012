class Admin::TablesController < ApplicationController
  layout 'admin'
  # GET /admin/tables
  # GET /admin/tables.json
  def index
    @admin_tables = Table.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_tables }
    end
  end

  # GET /admin/tables/1
  # GET /admin/tables/1.json
  def show
    @admin_table = Table.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_table }
    end
  end

  # GET /admin/tables/new
  # GET /admin/tables/new.json
  def new
    @admin_table = Table.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_table }
    end
  end

  # GET /admin/tables/1/edit
  def edit
    @admin_table = Table.find(params[:id])
  end

  # POST /admin/tables
  # POST /admin/tables.json
  def create
    @admin_table = Table.new(params[:admin_table])

    respond_to do |format|
      if @admin_table.save
        format.html { redirect_to @admin_table, notice: 'Table was successfully created.' }
        format.json { render json: @admin_table, status: :created, location: @admin_table }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/tables/1
  # PUT /admin/tables/1.json
  def update
    @admin_table = Table.find(params[:id])

    respond_to do |format|
      if @admin_table.update_attributes(params[:admin_table])
        format.html { redirect_to @admin_table, notice: 'Table was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/tables/1
  # DELETE /admin/tables/1.json
  def destroy
    @admin_table = Table.find(params[:id])
    @admin_table.destroy

    respond_to do |format|
      format.html { redirect_to admin_tables_url }
      format.json { head :no_content }
    end
  end
end
