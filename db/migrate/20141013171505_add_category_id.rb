class AddCategoryId < ActiveRecord::Migration
  def change
  	add_column :categories, :category_id, :string
  end
end
