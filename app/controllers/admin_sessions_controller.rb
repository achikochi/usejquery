class AdminSessionsController < ApplicationController
  def create
    session[:admin_username] = params[:username]
    session[:admin_password] = params[:password]
    
    flash[:notice] = "Hello Master!"
    redirect_to new_post_path
  end
  
  def destroy
    reset_session
    
    flash[:notice] = "Bye Master!"
    redirect_to root_path
  end
end