class UserSerializer < ActiveModel::Serializer
  #attributes :id, :email, :password
  attributes :name, :email, :password, :password_confirmation
end
