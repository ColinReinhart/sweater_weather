class Location
  attr_reader :lat,
              :lon,
              :city

  def initialize(argument)
    @lat = argument[:results].first[:locations].first[:latLng][:lat]
    @lon = argument[:results].first[:locations].first[:latLng][:lng]
    @city = argument[:results].first[:locations].first[:adminArea5]
  end

end
