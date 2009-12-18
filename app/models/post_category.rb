# == Schema Information
#
# Table name: post_categories
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class PostCategory < ActiveRecord::Base
  has_many :post_categorizations
  has_many :posts, :through => :post_categorizations
  
  validates_presence_of :name
end
