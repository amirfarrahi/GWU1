class GameSerializer < ActiveModel::Serializer
  attributes :id, :condition_id, :travel_mod, :user_id, :status, :start_date, :end_date, :origin, :destination, :budget, :travel_time, :current_loc_type, :location_id
end
