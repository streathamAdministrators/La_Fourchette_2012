class Admin::ItemsController < ApplicationController
  
  #before_filter :login_required
  layout 'admin'
  
  # GET /admin/items
  # GET /admin/items.json
  def index
    @items = Item.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @item }
    end
  end

  # GET /admin/items/1
  # GET /admin/items/1.json
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /admin/items/new
  # GET /admin/items/new.json
  def new
    @item = Item.new
    @product_type = ProductType.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /admin/items/1/edit
  def edit
    @item = Item.find(params[:id])
    @product_type = ProductType.all
  end

  # POST /admin/items
  # POST /admin/items.json
  def create
    @item = Item.new(params[:item])
    @product_type = ProductType.all

    respond_to do |format|
      if @item.save
        format.html { redirect_to admin_item_path(@item), notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/items/1
  # PUT /admin/items/1.json
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to admin_item_path(@item), notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

    def desactivate 
      @item = Item.find(params[:id])
      @item.update_attribute(:is_active, false)
    
      respond_to do |format|
        format.html { redirect_to admin_items_url }
        format.json { head :no_content }
      end
    end

    def activate 
      @item = Item.find(params[:id])
      @item.update_attribute(:is_active, true)
      
      respond_to do |format|
        format.html { redirect_to admin_items_url }
        format.json { head :no_content }
      end
    end
  
end
