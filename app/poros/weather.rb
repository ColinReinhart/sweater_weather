class Weather
  attr_reader :id,
              :type,
              :current_weather,
              :hourly_weather,
              :daily_weather,
              :daily_long,
              :hourly_long


  def initialize(attributes)
    @id = nil
    @type = "forecast"
    @current_weather = current(attributes)
    @hourly_weather = format_hourly(attributes[:hourly][0..7])
    @daily_weather = format_daily(attributes[:daily][0..4])
    @hourly_long = format_hourly(attributes[:hourly])
    @daily_long = format_daily(attributes[:daily])
  end

  def current(data)
    CurrentWeather.new(data)
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
