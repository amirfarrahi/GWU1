class BugSerializer < ActiveModel::Serializer
  attributes :id, :userid, :gameid, :bugdetails
end
