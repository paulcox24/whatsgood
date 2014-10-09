class EditEvents < ActiveRecord::Migration
  def change
    rename_column :events, :event_type, :category
    remove_column :events, :runtime
    add_column :events, :stop_time, :datetime
    add_column :events, :image, :binary
    add_column :events, :venue_name, :string
    add_column :events, :venue_address, :text
    add_column :events, :city_name, :string

  end
end
