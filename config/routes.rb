ActionController::Routing::Routes.draw do |map|
  map.root :controller => "posts"
  
  map.blog "blog", :controller => "posts"
  map.resources :posts
  map.post_slug '/posts/:id/:slug', :controller => "posts", :action => "show"
  
  map.resources :post_categories
  map.post_category_slug '/posts/categories/:id/:slug', :controller => "post_categories", :action => "show"
  
  map.resources :post_comments
  
  map.admin_login "admin", :controller => "admin_sessions", :action => "new"
  map.admin_logout "admin/logout", :controller => "admin_sessions", :action => "destroy"
  map.resources :admin_sessions
  
  map.resources :sites
  map.site_slug "/sites/:id/:slug", :controller => "sites", :action => "show"
  
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"
end
