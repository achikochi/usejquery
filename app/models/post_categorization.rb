# == Schema Information
#
# Table name: post_categorizations
#
#  id               :integer         not null, primary key
#  post_id          :integer
#  post_category_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class PostCategorization < ActiveRecord::Base
  belongs_to :post
  belongs_to :post_category
end