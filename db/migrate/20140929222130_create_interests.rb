class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.string :interest_type
      t.string :genre
      t.references :user, index: true

      t.timestamps
    end
  end
end
