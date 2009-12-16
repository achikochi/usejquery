class CreatePostCategorizations < ActiveRecord::Migration
  def self.up
    create_table :post_categorizations do |t|
      t.integer :post_id
      t.integer :post_category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :post_categorizations
  end
end
