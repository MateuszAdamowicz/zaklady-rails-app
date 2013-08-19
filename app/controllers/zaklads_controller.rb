class ZakladsController < ApplicationController
  # GET /zaklads
  # GET /zaklads.json
  def index
    @zaklads = Zaklad.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @zaklads }
    end
  end

  # GET /zaklads/1
  # GET /zaklads/1.json
  def show
    @zaklad = Zaklad.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @zaklad }
    end
  end

  # GET /zaklads/new
  # GET /zaklads/new.json
  def new
    @zaklad = Zaklad.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @zaklad }
    end
  end

  # GET /zaklads/1/edit
  def edit
    @zaklad = Zaklad.find(params[:id])
  end

  # POST /zaklads
  # POST /zaklads.json
  def create
    @zaklad = Zaklad.new(params[:zaklad])

    respond_to do |format|
      if @zaklad.save
        format.html { redirect_to @zaklad, notice: 'Zaklad was successfully created.' }
        format.json { render json: @zaklad, status: :created, location: @zaklad }
      else
        format.html { render action: "new" }
        format.json { render json: @zaklad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /zaklads/1
  # PUT /zaklads/1.json
  def update
    @zaklad = Zaklad.find(params[:id])

    respond_to do |format|
      if @zaklad.update_attributes(params[:zaklad])
        format.html { redirect_to @zaklad, notice: 'Zaklad was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @zaklad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zaklads/1
  # DELETE /zaklads/1.json
  def destroy
    @zaklad = Zaklad.find(params[:id])
    @zaklad.destroy

    respond_to do |format|
      format.html { redirect_to zaklads_url }
      format.json { head :no_content }
    end
  end
end
