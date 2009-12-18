class PostsController < ApplicationController
  before_filter :authorize_admin, :except => ["index"]
  
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
  end
end