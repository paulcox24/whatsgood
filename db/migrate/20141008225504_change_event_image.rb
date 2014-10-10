class ChangeEventImage < ActiveRecord::Migration
  def change
    remove_column :events, :image, :binary
    add_column :events, :image_url, :string
  end
end
