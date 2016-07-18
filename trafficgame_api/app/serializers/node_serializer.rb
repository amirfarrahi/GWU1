class NodeSerializer < ActiveModel::Serializer
  attributes :id, :name, :desc, :lat, :lon
end
