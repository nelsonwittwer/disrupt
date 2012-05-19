class DiscussionsController < ApplicationController
  before_filter :get_startup


  def get_startup
    @startup = Startup.find(params[:startup_id])
  end
  # GET /discussions
  # GET /discussions.json
  def index
    @discussions = @startup.discussions.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @discussions }
    end
  end

  # GET /discussions/1
  # GET /discussions/1.json
  def show
    @discussion = @startup.discussions.find(params[:id])
    @comments = @discussion.comments.scoped

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @discussion }
    end
  end

  # GET /discussions/new
  # GET /discussions/new.json
  def new
    @discussion = @startup.discussions.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @discussion }
    end
  end

  # GET /discussions/1/edit
  def edit
    @discussion = @startup.discussions.find(params[:id])
  end

  # POST /discussions
  # POST /discussions.json
  def create
    @discussion = @startup.discussions.new(params[:discussion])

    respond_to do |format|
      if @discussion.save
        format.html { redirect_to startup_path(@startup), notice: 'Discussion was successfully created.' }
        format.json { render json: @discussion, status: :created, location: @discussion }
      else
        format.html { render action: "new" }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /discussions/1
  # PUT /discussions/1.json
  def update
    @discussion = @startup.discussions.find(params[:id])

    respond_to do |format|
      if @discussion.update_attributes(params[:discussion])
        format.html { redirect_to startup_path(@startup), notice: 'Discussion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discussions/1
  # DELETE /discussions/1.json
  def destroy
    @discussion = @startup.discussions.find(params[:id])
    @discussion.destroy

    respond_to do |format|
      format.html { redirect_to startup_path(@startup) }
      format.json { head :no_content }
    end
  end
end
