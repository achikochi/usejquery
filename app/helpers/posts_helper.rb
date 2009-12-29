module PostsHelper
  def is_active?(global, local)
    global ? global.name == local.name ? " class='active'" : nil : nil
  end
  
  def search_value
    params[:search] ? "Last Search: #{params[:search]}" : "Search the Blog"
  end
  
  def in_session_post_comments?(comment)
    unless session[:post_comments].blank?
      return true if session[:post_comments].include? comment.id
    end
    
    false
  end
end
