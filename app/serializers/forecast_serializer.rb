class ForecastSerializer
  include JSONAPI::Serializer
  attributes :id,
              :type,
              :sunrise,
              :sunset,
              :temperature,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon,
              :hourly_weather,
              :daily_weather
end
