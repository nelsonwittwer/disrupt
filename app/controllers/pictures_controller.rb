class PicturesController < ApplicationController
load_and_authorize_resource
  before_filter :get_startup

  def get_startup
    @startup = Startup.find(params[:startup_id])
  end

  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = @startup.pictures.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pictures }
    end
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @picture = @startup.pictures.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @picture }
    end
  end

  # GET /pictures/new
  # GET /pictures/new.json
  def new
    @picture = @startup.pictures.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @picture }
    end
  end

  # GET /pictures/1/edit
  def edit
    @picture = @startup.pictures.find(params[:id])
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = @startup.pictures.new(params[:picture])

    respond_to do |format|
      if @picture.save
        format.html { redirect_to startup_path(@startup), notice: 'Picture was successfully created.' }
        format.json { render json: @picture, status: :created, location: @picture }
      else
        format.html { render action: "new" }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pictures/1
  # PUT /pictures/1.json
  def update
    @picture = @startup.pictures.find(params[:id])

    respond_to do |format|
      if @picture.update_attributes(params[:picture])
        format.html { redirect_to @picture, notice: 'Picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture = @startup.pictures.find(params[:id])
    @picture.destroy

    respond_to do |format|
      format.html { redirect_to startup_pictures_path(@startup) }
      format.json { head :no_content }
    end
  end
end
