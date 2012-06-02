class Admin::ProductTypesController < ApplicationController
  layout 'admin'
  # GET /admin/producttypes
  # GET /admin/producttypes.json
  def index
    @product_types = ProductType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_types }
    end
  end

  # GET /admin/producttypes/1
  # GET /admin/producttypes/1.json
  def show
    @product_type = ProductType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_type }
    end
  end

  # GET /admin/producttypes/new
  # GET /admin/producttypes/new.json
  def new
    @product_type = ProductType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_type }
    end
  end

  # GET /admin/producttypes/1/edit
  def edit
    @product_type = ProductType.find(params[:id])
  end

  # POST /admin/producttypes
  # POST /admin/producttypes.json
  def create
    @product_type = ProductType.new(params[:product_type])

    respond_to do |format|
      if @product_type.save
        format.html { redirect_to admin_product_type_path(@product_type), notice: 'Producttype was successfully created.' }
        format.json { render json: @product_type, status: :created, location: @product_type }
      else
        format.html { render action: "new" }
        format.json { render json: @product_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/producttypes/1
  # PUT /admin/producttypes/1.json
  def update
    @product_type = ProductType.find(params[:id])

    respond_to do |format|
      if @product_type.update_attributes(params[:product_type])
        format.html { redirect_to admin_product_type_path(@product_type), notice: 'Producttype was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/producttypes/1
  # DELETE /admin/producttypes/1.json
  def destroy
    @product_type = ProductType.find(params[:id])
    @product_type.destroy

    respond_to do |format|
      format.html { redirect_to admin_product_types_url }
      format.json { head :no_content }
    end
  end
end
