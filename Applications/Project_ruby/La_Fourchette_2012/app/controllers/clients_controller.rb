class ClientsController < ApplicationController
  # GET /tables
  # GET /tables.json
  def index
    @table = Table.new
    @tables = Table.find_all_by_is_available(true)
  end
  
  # POST /tables
  # Permet d'initialiser la table en checkant son availability.
  def initTable
    @table = Table.find(params[:table]['id'])
    if @table.update_attribute(:is_available, false)
      redirect_to show_path(@table), notice: 'Bienvenue sur la table.'
    else 
      redirect_to :root
    end
  end
  
    # GET /tables/1
  # GET /tables/1.json
  def show
    @table = Table.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @table }
    end
  end
  
  # GET /meals
  # GET /meals.json
  def meal
    @meals = Meal.all

    respond_to do |format|
      #format.html # index.html.erb
      format.json { render json: @meals, :only => [:id, :name, :price], :include => { :items => {:only => [:id, :name, :description, :price, :time], :include => {:product_type => { :only => [:id, :name]}}}} }
    end
  end
  
  # GET /items
  # GET /items.json
  def item
    @items = Item.select {|k,v| k.product_type_id != 4 }

    respond_to do |format|
      #format.html # index.html.erb
      format.json { render json: @items, :only => [:id, :name, :description, :price, :time], :include => {:product_type => { :only => [:id, :name]}}}
    end
  end
  
  # GET /drinks
  # GET /drinks.json
  def drink
    @drinks = Item.select {|k,v| k.product_type_id == 4 }
    
    respond_to do |format|
      #format.html # index.html.erb
      format.json { render json: @drinks, :only => [:id, :name, :description, :price, :time], :include => {:product_type => { :only => [:id, :name]}}}
    end
  end
  
  
  def temp
    
  end
  
end