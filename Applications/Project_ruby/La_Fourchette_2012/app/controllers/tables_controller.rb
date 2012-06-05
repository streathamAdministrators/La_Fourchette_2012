class TablesController < ApplicationController
  # GET /tables
  # GET /tables.json
  def index
    @table = Table.new
    @tables = Table.find_all_by_is_available(true)
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
    @table = Table.find(params[:table]['id'])
    if @table.update_attribute(:is_available, false)
      redirect_to table_path(@table), notice: 'Bienvenue sur la table.'
    else 
      redirect_to :root
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