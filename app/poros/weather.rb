class Weather
  attr_reader :id,
              :type,
              :current_weather,
              :hourly_weather,
              :daily_weather


  def initialize(attributes)
    @id = nil
    @type = "forecast"
    @current_weather = current(attributes)
    @hourly_weather = format_hourly(attributes[:hourly][0..7])
    @daily_weather = format_daily(attributes[:daily][0..4])
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
