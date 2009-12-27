# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  helper_method :admin?
  
  protected
  
  def admin?
    session[:admin_username] == APP_CONFIG["admin_username"] && session[:admin_password] == APP_CONFIG["admin_password"]
  end
  
  def authorize_admin
    unless admin?
      flash[:error] = "Unauthorized access"
      redirect_to root_path
      false
    end
  end
  
  def prepare_blog_sidebar
    @post_categories = PostCategory.find :all, :order => "name ASC"
    @latest_posts = Post.find :all, :limit => 7, :order => "created_at DESC", :conditions => ["published = ?", true]
  end
end
