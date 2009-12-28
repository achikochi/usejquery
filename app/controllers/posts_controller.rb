class PostsController < ApplicationController
  before_filter :authorize_admin, :except => ["index", "show"]
  before_filter :prepare_blog_sidebar, :only => ["index", "show"]
  
  def new
    @post = Post.new
    @post_category = PostCategory.new
  end
  
  def create
    @post = Post.new params[:post]
    @post_category = PostCategory.new
    
    if @post.save
      flash[:notice] = "Successfully created Post"
      redirect_to @post
    else
      render :action => "new"
    end
  end
  
  def edit
    @post = Post.find params[:id]
    @post_category = PostCategory.new
    render :action => "new"
  end
  
  def update
    @post = Post.find params[:id]
    @post_category = PostCategory.new
    
    if @post.update_attributes params[:post]
      flash[:notice] = "Successfully updated Post"
      redirect_to @post
    else
      render :action => "new"
    end
  end
  
  def show
    begin
      @post = admin? ? Post.find(params[:id]) : Post.find(params[:id], :conditions => ["published = ?", true])
      @search = Post.search
    rescue ActiveRecord::RecordNotFound
      render :action => "404"
    end
  end
  
  def index
    @search = Post.search(:title_like_or_excerpt_like_or_content_like => params[:search])
    @posts = @search.paginate :page => params[:page], :per_page => 7, :order => "created_at DESC"
    
    render :action => "404" if @posts.size == 0
  end
end