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
#  published  :boolean
#

class PostComment < ActiveRecord::Base
  attr_protected :published
  belongs_to :post
  
  validates_presence_of :name, :email, :message, :post_id
  validates_email_format_of :email, :message => "must be a valid e-mail address"
  validates_url_format_of :url, :message => "must be a valid url"
end
