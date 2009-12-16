class PostsController < ApplicationController
  before_filter :authorize_admin, :except => ["index"]
end