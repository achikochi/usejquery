# == Schema Information
#
# Table name: post_comments
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  url        :string(255)
#  message    :text
#  created_at :datetime
#  updated_at :datetime
#  post_id    :integer
#

class PostComment < ActiveRecord::Base
  belongs_to :post
end