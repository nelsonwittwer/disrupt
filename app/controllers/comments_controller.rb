class CommentsController < ApplicationController
  before_filter :get_startup

  def get_startup
    @startup = Startup.find(params[:startup_id])
    get_discussion
  end
  def get_discussion
    @discussion=@startup.discussions.find(params[:discussion_id])
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = @discussion.comments.new(:parent_id => params[:parent_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  def index
  @comments = Comment.scoped

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end


  # GET /comments/1/edit
  def edit
    @comment = @discussion.comments.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = @discussion.comments.new(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to startup_discussion_path(@startup, @discussion), notice: 'comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = @discussion.comments.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to startup_discussion_path(@startup, @discussion), notice: 'comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = @discussion.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to startup_discussion_path(@startup, @discussion) }
      format.json { head :no_content }
    end
  end
end
