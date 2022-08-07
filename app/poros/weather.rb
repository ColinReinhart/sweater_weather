class Weather
  attr_reader :id,
              :date,
              :sunrise,
              :sunset,
              :temperature,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon

  def initialize(attributes)
    @id = nil
    @date = date_format(attributes[:current][:dt])
    @sunrise = date_format(attributes[:current][:sunrise])
    @sunset = date_format(attributes[:current][:sunset])
    @temperature = attributes[:current][:temp]
    @feels_like = attributes[:current][:feels_like]
    @humidity = attributes[:current][:humidity]
    @uvi = attributes[:current][:uvi]
    @visibility = attributes[:current][:visibility]
    @conditions = attributes[:current][:weather].first[:description]
    @icon = attributes[:current][:weather].first[:icon]
    @hourly_weather = remove_hour_data(attributes[:hourly][0..7])
    @daily_weather = attributes[:daily][0..4]
    require "pry"; binding.pry
  end

  def date_format(utc)
    date = Time.zone.at(utc).strftime('%b %e, %l:%M %p')
  end

  def remove_hour_data(data)
    data.each do |hour|
      hour.delete(:feels_like)
      hour.delete(:pressure)
      hour.delete(:humidity)
      hour.delete(:dew_point)
      hour.delete(:uvi)
      hour.delete(:clouds)
      hour.delete(:visibility)
      hour.delete(:wind_speed)
      hour.delete(:wind_deg)
      hour.delete(:wind_gust)
      hour.delete(:pop)
      conditions[:hour][:weather][:id][:description].first
    end
  end

end
