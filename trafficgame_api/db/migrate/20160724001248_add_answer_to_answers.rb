class AddAnswerToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :answer, :text
  end
end
