class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :condition_id
      t.integer :travel_mod
      t.integer :user_id
      t.integer :status
      t.timestamp :start_date
      t.timestamp :end_date
      t.integer :origin
      t.integer :destination
      t.float :budget
      t.float :travel_time
      t.text :current_loc_type
      t.integer :location_id

      t.timestamps
    end
  end
end
