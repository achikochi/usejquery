class Post < ActiveRecord::Base
  has_many :post_categorizations
  has_many :categories, :through => :post_categorizations, :source => :post_category
end