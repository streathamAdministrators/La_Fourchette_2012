class Admin::ItemsController < ApplicationController
  layout 'admin'
  # GET /admin/items
  # GET /admin/items.json
  def index
    @admin_items = Item.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_item }
    end
  end

  # GET /admin/items/1
  # GET /admin/items/1.json
  def show
    @admin_item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_item }
    end
  end

  # GET /admin/items/new
  # GET /admin/items/new.json
  def new
    @admin_item = Item.new
    @product_type = ProductType.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_item }
    end
  end

  # GET /admin/items/1/edit
  def edit
    @admin_item = Item.find(params[:id])
  end

  # POST /admin/items
  # POST /admin/items.json
  def create
    @admin_item = Item.new(params[:admin_item])

    respond_to do |format|
      if @admin_item.save
        format.html { redirect_to admin_item_path(@admin_item), notice: 'Item was successfully created.' }
        format.json { render json: @admin_item, status: :created, location: @admin_item }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/items/1
  # PUT /admin/items/1.json
  def update
    @admin_item = Item.find(params[:id])

    respond_to do |format|
      if @admin_item.update_attributes(params[:item])
        format.html { redirect_to admin_item_path(@admin_item), notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/items/1
  # DELETE /admin/items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to admin_items_url }
      format.json { head :no_content }
    end
  end
end
