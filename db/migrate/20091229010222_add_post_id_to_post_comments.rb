class AddPostIdToPostComments < ActiveRecord::Migration
  def self.up
    add_column :post_comments, :post_id, :integer
  end

  def self.down
    remove_column :post_comments, :post_id
  end
end
