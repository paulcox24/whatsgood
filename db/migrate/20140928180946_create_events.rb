class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :starttime
      t.integer :runtime
      t.references :venue, index: true
      t.text :description
      t.string :type
      t.string :genre
      t.string :name
      t.integer :rating
      t.string :website

      t.timestamps
    end
  end
end
