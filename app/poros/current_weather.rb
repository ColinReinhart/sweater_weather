class CurrentWeather
  attr_reader :date,
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
      @date = date_format((attributes[:current][:dt]) - attributes[:timezone_offset])
      @sunrise = date_format((attributes[:current][:sunrise])- attributes[:timezone_offset])
      @sunset = date_format((attributes[:current][:sunset])- attributes[:timezone_offset])
      @temperature = attributes[:current][:temp]
      @feels_like = attributes[:current][:feels_like]
      @humidity = attributes[:current][:humidity]
      @uvi = attributes[:current][:uvi]
      @visibility = attributes[:current][:visibility]
      @conditions = attributes[:current][:weather].first[:description]
      @icon = attributes[:current][:weather].first[:icon]
    end


      def date_format(utc)
        date = Time.zone.at(utc).strftime('%b %e, %l:%M %p')
      end
end
