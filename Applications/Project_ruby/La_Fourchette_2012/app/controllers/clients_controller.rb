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
      redirect_to table_path(@table), notice: 'Bienvenue sur la table.'
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
  
  def temp
    
  end
  
end