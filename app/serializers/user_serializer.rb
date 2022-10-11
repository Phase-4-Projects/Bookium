class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :full_name, :location, :profile_color

end
