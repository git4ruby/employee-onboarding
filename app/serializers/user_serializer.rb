class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :first_name, :last_name, :email, :phone_number, :address
end
