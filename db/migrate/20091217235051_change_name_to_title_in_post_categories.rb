class ChangeNameToTitleInPostCategories < ActiveRecord::Migration
  def self.up
    rename_column :post_categories, :name, :title
  end

  def self.down
    rename_column :post_categories, :title, :name
  end
end
