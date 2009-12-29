class PostCommentsController < ApplicationController
  def new
    redirect_to root_url #no post_id given..
  end
  
  def create
    @post = Post.find params[:post_comment][:post_id]
    @post_comment = @post.post_comments.new params[:post_comment]
    
    if @post_comment.save
      session[:post_comments] ? session[:post_comments] << @post_comment.id : session[:post_comments] = [@post_comment.id]
      flash[:notice] = "Successfully posted your Comment"
      redirect_to post_path(@post)
    else
      render :action => "new"
    end
  end
end