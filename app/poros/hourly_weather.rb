class HourlyWeather
  attr_reader :time,
              :temp,
              :conditions,
              :icon

  def initialize(argument)
    @time = date_format(argument[:dt])
    @temp = argument[:temp]
    @conditions = argument[:weather].first[:description]
    @icon = argument[:weather].first[:icon]
  end

  def date_format(utc)
    date = Time.zone.at(utc).strftime('%b %e, %l:%M %p')
  end
end
