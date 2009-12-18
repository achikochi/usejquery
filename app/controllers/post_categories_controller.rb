class PostCategoriesController < ApplicationController
  before_filter :authorize_admin
  
  def create
    PostCategory.create params[:post_category]
    render :nothing => true
  end
end