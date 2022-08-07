class LocationFacade

def self.get_location(search)
  location = LocationService.find_lat_lon(search)
  Location.new(location)
end

end
