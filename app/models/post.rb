# == Schema Information
#
# Table name: posts
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  excerpt    :text
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#  published  :boolean
#

class Post < ActiveRecord::Base
  has_many :post_categorizations
  has_many :categories, :through => :post_categorizations, :source => :post_category
  
  validates_presence_of :title, :excerpt, :content
  
  def slug
    title.downcase
  end
end
