class UserSerializer
  include JSON::Serializer

  set_id :id
  set_type :users
  
  attributes :email, :api_key
end
