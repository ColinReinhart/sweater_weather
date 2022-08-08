class Munchie
  attr_reader :id,
              :type,
              :destination_city,
              

  def initialize(argument)
    @id = nil
    @type = "forecast"
    @destination_city = argument[:businesses].first[:location][:city]
  end

end
