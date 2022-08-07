class Location
  attr_reader :lat,
              :lon

  def initialize(argument)
    @lat = argument[:results].first[:locations].first[:latLng][:lat]
    @lon = argument[:results].first[:locations].first[:latLng][:lng]
  end

end
