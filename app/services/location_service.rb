class LocationService < BaseService

  def self.find_lat_lon(search)
    conn = Faraday.new(url: "http://www.mapquestapi.com") do |f|
      f.params['key'] = ENV['maps_api']
      f.params['location'] = search
    end
    response = conn.get('/geocoding/v1/address')
    get_json(response)
  end

end
