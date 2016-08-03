class CreateUserfeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :userfeeds do |t|
      t.integer :game_id
      t.integer :user_id
      t.integer :question_id
      t.integer :answer_id

      t.timestamps
    end
  end
end
