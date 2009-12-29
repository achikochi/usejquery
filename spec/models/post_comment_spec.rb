require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PostComment do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :email => "value for email",
      :url => "value for url",
      :message => "value for message"
    }
  end

  it "should create a new instance given valid attributes" do
    PostComment.create!(@valid_attributes)
  end
end
