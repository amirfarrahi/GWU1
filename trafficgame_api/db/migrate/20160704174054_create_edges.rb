class CreateEdges < ActiveRecord::Migration[5.0]
  def change
    create_table :edges do |t|
      t.string :name
      t.string :desc

      t.timestamps
    end
  end
end
