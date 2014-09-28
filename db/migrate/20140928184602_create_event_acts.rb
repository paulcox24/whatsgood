class CreateEventActs < ActiveRecord::Migration
  def change
    create_table :event_acts do |t|
      t.references :event, index: true
      t.references :act, index: true

      t.timestamps
    end
  end
end
