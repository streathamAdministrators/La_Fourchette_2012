class TablesController < ApplicationController
  # GET /tables
  # GET /tables.json
  def index
    @table = Table.new
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

  # GET /tables/new
  # GET /tables/new.json
  def new
    @table = Table.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @table }
    end
  end

  # GET /tables/1/edit
  def edit
    @table = Table.find(params[:id])
  end

  # POST /tables
  # POST /tables.json
  def create
    @table = Table.new(params[:table])

    respond_to do |format|
      if @table.save
        format.html { redirect_to @table, notice: 'Table was successfully created.' }
        format.json { render json: @table, status: :created, location: @table }
      else
        format.html { render action: "new" }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /tables
  # Permet d'initialiser la table en checkant son availability.
  def initTable
    # find_by_numero_table ne peut pas fonctionner car pas de champs numero_table dans le model
    @table = Table.find_by_number_table(params[:number_table])
    # tu peux aussi l'ecrire @table.nil?
    if @table != nil && @table.is_available == true 
      # Penses à utiliser les routes REST prévu par RoR.
      redirect_to table_path(@table) #:action => 'show', :id => @table.id
      @table.is_available = 0
      # Je me demande s'il est pas plus judicieux d'utiliser .update (à voir)
      @table.save
    elsif @table.is_available == 0
      # Route en pluggant à REST
      redirect_to tables_path #:action => 'index' #, notice: 'Table occupée'
    else
      # Route en pluggant à REST
      redirect_to tables_path #:action => 'index' #, notice: 'Table inexistante
    end
  end

  # PUT /tables/1
  # PUT /tables/1.json
  def update
    @table = Table.find(params[:id])

    respond_to do |format|
      if @table.update_attributes(params[:table])
        format.html { redirect_to @table, notice: 'Table was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tables/1
  # DELETE /tables/1.json
  def destroy
    @table = Table.find(params[:id])
    @table.destroy

    respond_to do |format|
      format.html { redirect_to tables_url }
      format.json { head :no_content }
    end
  end
    
end