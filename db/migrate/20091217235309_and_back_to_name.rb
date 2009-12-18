class AndBackToName < ActiveRecord::Migration
  #sorry, baked :)
  
  def self.up
    rename_column :post_categories, :title, :name
  end

  def self.down
    rename_column :post_categories, :name, :title
  end
end
