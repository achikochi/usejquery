class PostsController < ApplicationController
  before_filter :authorize_admin, :except => ["index", "show"]
  
  def new
    @post = Post.new
    @post_category = PostCategory.new
  end
  
  def create
    @post = Post.new params[:post]
    
    if @post.save
      flash[:notice] = "Successfully created Post"
      redirect_to @post
    else
      render :action => "new"
    end
  end
  
  def show
    @post = Post.find params[:id]
    @post_categories = PostCategory.all
    @latest_posts = Post.find :all, :limit => 7, :order => "created_at DESC"
  end
  
  def index
    @posts = Post.find :all
  end
end