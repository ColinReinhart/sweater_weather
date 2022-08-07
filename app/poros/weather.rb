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
              :icon,
              :hourly_weather,
              :daily_weather

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
    @hourly_weather = format_hourly(attributes[:hourly][0..7])
    @daily_weather = format_daily(attributes[:daily][0..4])
  end

  def date_format(utc)
    date = Time.zone.at(utc).strftime('%b %e, %l:%M %p')
  end

  def format_hourly(data)
    data.map do |hour|
      HourlyWeather.new(hour)
    end
  end

  def format_daily(data)
    data.map do |day|
      DailyWeather.new(day)
    end
  end

end
