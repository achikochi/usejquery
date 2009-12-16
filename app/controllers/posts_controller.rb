class PostsController < ApplicationController
  before_filter :authorize_admin, :except => ["index"]
  
  def new
    @post = Post.new
  end
end