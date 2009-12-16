class Post < ActiveRecord::Base
  has_many :post_categorizations
  has_many :post_categories, :through => :post_categorizations
end
