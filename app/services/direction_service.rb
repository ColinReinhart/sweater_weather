class DirectionService < BaseService

  def self.get_directions(from, to)
    conn = Faraday.new(url: "http://www.mapquestapi.com") do |f|
      f.params['key'] = ENV['maps_api']
      f.params['from'] = from
      f.params['to'] = to
    end
    response = conn.get('/directions/v2/route')
    get_json(response)
  end
end
