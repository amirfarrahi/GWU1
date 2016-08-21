class CreateUserlocations < ActiveRecord::Migration[5.0]
  def change
    create_table :userlocations do |t|
      t.integer :user_id
      t.float :lat
      t.float :lon

      t.timestamps
    end
  end
end
