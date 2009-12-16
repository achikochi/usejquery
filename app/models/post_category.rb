class PostCategory < ActiveRecord::Base
  has_many :post_categorizations
  has_many :posts, :through => :post_categorizations
end