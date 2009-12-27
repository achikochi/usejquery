module PostsHelper
  def is_active?(global, local)
    global ? global.name == local.name ? " class='active'" : nil : nil
  end
end
