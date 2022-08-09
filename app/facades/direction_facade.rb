class DirectionFacade

  def self.directions(from, to)
    the_way = DirectionService.get_directions(from, to)
    Direction.new(the_way)
  end

end
