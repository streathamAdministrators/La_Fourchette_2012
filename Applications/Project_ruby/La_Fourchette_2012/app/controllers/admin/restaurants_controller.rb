class Admin::RestaurantsController < ApplicationController

  #before_filter :login_required
  layout 'admin'
  #GET /admin/restaurants/welcome
  def welcome

  end

  # GET /admin/restaurants
  # GET /admin/restaurants.json
  def index
    @restaurants = Restaurant.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @restaurants }
    end
  end

  # GET /admin/restaurants/1
  # GET /admin/restaurants/1.json
  def show
    @restaurant = Restaurant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @restaurant }
    end
  end

  # GET /admin/restaurants/new
  # GET /admin/restaurants/new.json
  def new
    @restaurant = Restaurant.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @restaurant }
    end
  end

  # GET /admin/restaurants/1/edit
  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  # POST /admin/restaurants
  # POST /admin/restaurants.json
  def create
    @restaurant = Restaurant.new(params[:restaurant])

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to admin_restaurant_path(@restaurant), notice: 'Restaurant was successfully created.' }
        format.json { render json: @restaurant, status: :created, location: @restaurant }
      else
        format.html { render action: "new" }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/restaurants/1
  # PUT /admin/restaurants/1.json
  def update
    @restaurant = Restaurant.find(params[:id])

    respond_to do |format|
      if @restaurant.update_attributes(params[:restaurant])
        format.html { redirect_to admin_restaurant_path(@restaurant), notice: 'Restaurant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end


  def activate
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update_attribute(:is_active, true)

    respond_to do |format|
      format.html { redirect_to admin_restaurants_url }
      format.json { head :no_content }
    end
  end

  def desactivate
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update_attribute(:is_active, false)
        
    @employee = Employee.find_by_restaurant_id(params[:id])
    if @employee != nil
      @employee.each do |employee|
        employee.update_attribute(:is_active, false)
      end     
    end
    
    

    respond_to do |format|
      format.html { redirect_to admin_restaurants_url }
      format.json { head :no_content }
    end
  end

end
