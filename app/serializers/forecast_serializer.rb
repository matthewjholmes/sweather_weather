class ForecastSerializer
  include JSONAPI::Serializer

  set_id :id
  set_type :forecast

  attributes :current_weater, :daily_weather, :hourly_weather

end
