class CreateBugs < ActiveRecord::Migration[5.0]
  def change
    create_table :bugs do |t|
      t.integer :userid
      t.integer :gameid
      t.string :bugdetails

      t.timestamps
    end
  end
end
