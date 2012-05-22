class StoriesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  #before_filter :load

  def load
    @stories = @stories.paginate(:page => params[:page])
    @story = Story.new   
  end
  
  def index
    #authorize! :index, @user, :message => 'Not authorized as an administrator.'
    #@users = User.paginate(:page => params[:page])
    # Index actions are already done by the load method
    @stories = @stories.paginate(:page => params[:page])
    @story = Story.new
  end
  
  def show
    @story = Story.find(params[:id])
=begin
    respond_to do |format|
      format.json { render :json => @story }
      format.xml  { render :xml => @story }
      format.html
    end
=end
  end
  
=begin
  def new
    @story = Story.new
  end
=end  
  def create
    #@stories = @stories.paginate(:page => params[:page])
    @story = Story.new(params[:story])
    if @story.save
	  flash[:notice] = "Successfully created story."
	  @stories = Story.paginate(:page => params[:page])
      #redirect_to :action => 'index'
      #redirect_to stories_url
    #else
      #render :action => 'index'
    end
  end
  
  def edit
    #@stories = @stories.paginate(:page => params[:page])
    @story = Story.find(params[:id])
    #render :action => "index"
  end
  
  def update
    @story = Story.find(params[:id])
    if @story.update_attributes(params[:story])
      flash[:notice] = "Successfully updated story."
	  @stories = Story.paginate(:page => params[:page])
    end
  end
  
  def destroy
    #@stories = @stories.paginate(:page => params[:page])
    @story = Story.find(params[:id])
    @story.destroy
    flash[:notice] = "Successfully destroyed story."
	@stories = Story.paginate(:page => params[:page])
    
  end

end
