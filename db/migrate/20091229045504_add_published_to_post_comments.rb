class AddPublishedToPostComments < ActiveRecord::Migration
  def self.up
    add_column :post_comments, :published, :boolean
  end

  def self.down
    remove_column :post_comments, :published
  end
end
