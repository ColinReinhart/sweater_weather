class DailyWeather
  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon

  def initialize(argument)
    @date = date_format(argument[:dt])
    @sunrise = date_format(argument[:sunrise])
    @sunset = date_format(argument[:sunset])
    @max_temp = argument[:temp][:max]
    @min_temp = argument[:temp][:min]
    @conditions = argument[:weather].first[:description]
    @icon = argument[:weather].first[:icon]
  end

    def date_format(utc)
      date = Time.zone.at(utc).strftime('%b %e, %l:%M %p')
    end

end
