class UserfeedSerializer < ActiveModel::Serializer
  attributes :id, :game_id, :user_id, :question_id, :answer_id
end
