class AddEventfulIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :eventful_id, :string
  end
end
