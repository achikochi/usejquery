module PostsHelper
  def is_active?(global, local)
    global ? global.name == local.name ? " class='active'" : nil : nil
  end
  
  def search_value
    params[:search] ? "Last Search: #{params[:search]}" : "Search the Blog"
  end
end
