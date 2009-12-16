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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PostCategorization do
  before(:each) do
    @valid_attributes = {
      :post_id => 1,
      :post_category_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    PostCategorization.create!(@valid_attributes)
  end
end
