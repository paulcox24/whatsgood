class CreateVenueActs < ActiveRecord::Migration
  def change
    create_table :venue_acts do |t|
      t.references :venue, index: true
      t.references :act, index: true

      t.timestamps
    end
  end
end
