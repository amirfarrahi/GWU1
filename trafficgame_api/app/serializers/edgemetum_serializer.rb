class EdgemetumSerializer < ActiveModel::Serializer
  attributes :id, :edge_id, :mode_id, :condition_id, :cost
end
