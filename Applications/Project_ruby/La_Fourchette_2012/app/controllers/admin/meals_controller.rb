class Admin::MealsController < ApplicationController
  
  #before_filter :login_required
  layout 'admin'
  
  # GET /admin/meals
  # GET /admin/meals.json
  def index
    @meals = Meal.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @meals }
    end
  end

  # GET /admin/meals/1
  # GET /admin/meals/1.json
  def show
    @meal = Meal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @meal }
    end
  end

  # GET /admin/meals/new
  # GET /admin/meals/new.json
  def new
    @meal = Meal.new
    @entree = Item.find_all_by_product_type_id(1)
    @main_dish = Item.find_all_by_product_type_id(2)
    @dessert = Item.find_all_by_product_type_id(3)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @meal }
    end
  end

  # GET /admin/meals/1/edit
  def edit
    @meal = Meal.find(params[:id])
    @entree = Item.find_all_by_product_type_id(1)
    @main_dish = Item.find_all_by_product_type_id(2)
    @dessert = Item.find_all_by_product_type_id(3)
  end

  # POST /admin/meals
  # POST /admin/meals.json
  def create
    @meal = Meal.new(params[:meal])
    @entree = Item.find_all_by_product_type_id(1)
    @main_dish = Item.find_all_by_product_type_id(2)
    @dessert = Item.find_all_by_product_type_id(3)

    respond_to do |format|
      if @meal.save
        format.html { redirect_to admin_meal_path(@meal), notice: 'Meal was successfully created.' }
        format.json { render json: @meal, status: :created, location: @meal }
      else
        format.html { render action: "new" }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/meals/1
  # PUT /admin/meals/1.json
  def update
    @meal = Meal.find(params[:id])

    respond_to do |format|
      if @meal.update_attributes(params[:meal])
        format.html { redirect_to admin_meal_path(@meal), notice: 'Meal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/meals/1
  # DELETE /admin/meals/1.json
  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy

    respond_to do |format|
      format.html { redirect_to admin_meals_url }
      format.json { head :no_content }
    end
  end
end
