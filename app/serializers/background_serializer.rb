class BackgroundSerializer
  include JSONAPI::Serializer

  set_id :id
  set_type :background
  
  attribute :image

end
