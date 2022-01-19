class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :current_weater, :daily_weather, :hourly_weather
end
