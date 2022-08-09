class Direction
  attr_reader :travel_hours,
              :formatted_time
              

  def initialize(argument)
    @formatted_time = argument[:route][:formattedTime]
    @travel_hours = argument[:route][:formattedTime].to_i

  end
end
