class PostCategoriesController < ApplicationController
  before_filter :authorize_admin, :except => ["show"]
  before_filter :prepare_blog_sidebar, :only => ["show"]
  
  def create
    PostCategory.create params[:post_category]
    render :nothing => true
  end
  
  def show
    @post_category = PostCategory.find(params[:id])
    @posts = @post_category.posts.paginate :page => params[:page], :per_page => 7, :order => "created_at DESC"
  end
end