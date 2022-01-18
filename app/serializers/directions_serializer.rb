class DirectionSerializer
  include JSONAPI::Serializer

  set_id :id
  set_type :direction

  attributes :start_city, :end_city, :travel_time, :weather_at_eta

end
