class PostCategoriesController < ApplicationController
  before_filter :authorize_admin, :except => ["show"]
  
  def create
    PostCategory.create params[:post_category]
    render :nothing => true
  end
  
  def show
    @post_category = PostCategory.find(params[:id])
    @posts = @post_category.posts.paginate :page => params[:page], :per_page => 7, :order => "created_at DESC"
    @post_categories = PostCategory.all
    @latest_posts = Post.find :all, :limit => 7, :order => "created_at DESC", :conditions => ["published = ?", true]
  end
end