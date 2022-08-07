class DailyWeather
  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon

  def initialize(argument)
    @date = argument[:dt]
    @sunrise = argument[:sunrise]
    @sunset = argument[:sunset]
    @max_temp = argument[:temp][:max]
    @min_temp = argument[:temp][:min]
    @conditions = argument[:weather].first[:description]
    @icon = argument[:weather].first[:icon]
  end
end
