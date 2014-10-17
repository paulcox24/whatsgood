class AddCategoryClasses < ActiveRecord::Migration
  def change
  	add_column :events, :category_list, :string
  end
end
