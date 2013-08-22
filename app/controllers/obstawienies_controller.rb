class ObstawieniesController < ApplicationController
  # GET /obstawienies
  # GET /obstawienies.json
  def index
    @obstawienies = Obstawienie.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @obstawienies }
    end
  end

  # GET /obstawienies/1
  # GET /obstawienies/1.json
  def show
    @obstawieny = Obstawienie.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @obstawieny }
    end
  end

  # GET /obstawienies/new
  # GET /obstawienies/new.json
  def new
    @obstawieny = Obstawienie.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @obstawieny }
    end
  end

  # GET /obstawienies/1/edit
  def edit
    @obstawieny = Obstawienie.find(params[:id])
  end

  # POST /obstawienies
  # POST /obstawienies.json
  def create


    
    @user = User.where(name: params[:Nick]).first
    if @user
      @obstawieny = Obstawienie.new({:zaklad_id => params[:Zaklad], :user_id => @user.id, :opcja => params[:Reputacja], :reputacja => params[:Ilosc], :wygrana => 0})
    else
      @obstawieny = Obstawienie.new({:zaklad_id => params[:Zaklad], :user_id => 1, :opcja => params[:Reputacja], :reputacja => params[:Ilosc], :wygrana => 0})
    end
    respond_to do |format|
      if not @user or @user.password != params[:Kod]
        format.html { redirect_to "/zaklads", notice: ["Błędny login lub kod"] }
        format.json { render json: @obstawieny.errors, status: :unprocessable_entity }
      else
        if @obstawieny.save
          format.html { redirect_to "/zaklads", notice: 'Zakład został postawiony!' }
          format.json { render json: @obstawieny, status: :created, location: @obstawieny }
        else
          format.html { redirect_to "/zaklads", notice: @obstawieny.errors.full_messages }
          format.json { render json: @obstawieny.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /obstawienies/1
  # PUT /obstawienies/1.json
  def update
    @obstawieny = Obstawienie.find(params[:id])

    respond_to do |format|
      if @obstawieny.update_attributes(params[:obstawieny])
        format.html { redirect_to @obstawieny, notice: 'Obstawienie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @obstawieny.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /obstawienies/1
  # DELETE /obstawienies/1.json
  def destroy
    @obstawieny = Obstawienie.find(params[:id])
    @obstawieny.destroy

    respond_to do |format|
      format.html { redirect_to obstawienies_url }
      format.json { head :no_content }
    end
  end
end
