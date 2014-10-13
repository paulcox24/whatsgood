class FixCategories < ActiveRecord::Migration
  def change
  	add_column :categories, :cat_id, :string
  	remove_column :categories, :category_id, :string
  end
end
