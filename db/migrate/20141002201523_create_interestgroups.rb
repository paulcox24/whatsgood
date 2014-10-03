class CreateInterestgroups < ActiveRecord::Migration
  def change
    create_table :interestgroups do |t|

      t.timestamps
    end
  end
end
