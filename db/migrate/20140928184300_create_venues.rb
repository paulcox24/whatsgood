class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.text :location
      t.string :name
      t.text :description
      t.string :type
      t.string :phone
      t.string :email
      t.string :website

      t.timestamps
    end
  end
end
