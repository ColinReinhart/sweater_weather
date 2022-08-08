class YelpFacade

  def self.find_place(lat, lon, search)
    restaurant = YelpService.find_food(lat, lon, search)
    Yelp.new(restaurant)
    require "pry"; binding.pry
  end

end
