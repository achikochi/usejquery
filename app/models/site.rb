# == Schema Information
#
# Table name: sites
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Site < ActiveRecord::Base
  def slug
    name.to_url
  end
end
