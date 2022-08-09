class YelpService < BaseService

  def self.find_food(lat, lon, search)
    conn = Faraday.new("https://api.yelp.com") do |f|
      f.params['latitude'] = lat
      f.params['longitude'] = lon
      f.params['categories'] = search
      f.headers['Authorization'] = "Bearer #{ENV['yelp_api']}"
    end
    response = conn.get('v3/businesses/search')
    get_json(response)
  end
end
