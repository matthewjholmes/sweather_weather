class UserSerializer
  include JSON::Serializer

  attributes :email, :api_key
end
