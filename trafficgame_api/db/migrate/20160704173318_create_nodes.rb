class CreateNodes < ActiveRecord::Migration[5.0]
  def change
    create_table :nodes do |t|
      t.string :name
      t.string :desc
      t.float :lat
      t.float :lon

      t.timestamps
    end
  end
end
