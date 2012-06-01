class Admin::RestaurantsController < ApplicationController
  layout 'admin'
  # GET /admin/restaurants
  # GET /admin/restaurants.json
  def index
    @admin_restaurants = Restaurant.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_restaurants }
    end
  end

  # GET /admin/restaurants/1
  # GET /admin/restaurants/1.json
  def show
    @admin_restaurant = Restaurant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_restaurant }
    end
  end

  # GET /admin/restaurants/new
  # GET /admin/restaurants/new.json
  def new
    @admin_restaurant = Restaurant.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_restaurant }
    end
  end

  # GET /admin/restaurants/1/edit
  def edit
    @admin_restaurant = Restaurant.find(params[:id])
  end

  # POST /admin/restaurants
  # POST /admin/restaurants.json
  def create
    @admin_restaurant = Restaurant.new(params[:restaurant])

    respond_to do |format|
      if @admin_restaurant.save
        format.html { redirect_to admin_restaurant_path(@admin_restaurant), notice: 'Restaurant was successfully created.' }
        format.json { render json: @admin_restaurant, status: :created, location: @admin_restaurant }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/restaurants/1
  # PUT /admin/restaurants/1.json
  def update
    @admin_restaurant = Restaurant.find(params[:id])

    respond_to do |format|
      if @admin_restaurant.update_attributes(params[:restaurant])
        format.html { redirect_to admin_restaurant_path(@admin_restaurant), notice: 'Restaurant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/restaurants/1
  # DELETE /admin/restaurants/1.json
  def destroy
    @admin_restaurant = Restaurant.find(params[:id])
    @admin_restaurant.destroy

    respond_to do |format|
      format.html { redirect_to admin_restaurants_url }
      format.json { head :no_content }
    end
  end
end
