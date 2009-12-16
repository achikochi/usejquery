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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Post do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :excerpt => "value for excerpt",
      :content => "value for content"
    }
  end

  it "should create a new instance given valid attributes" do
    Post.create!(@valid_attributes)
  end
end
