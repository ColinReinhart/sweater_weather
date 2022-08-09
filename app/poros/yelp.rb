class Yelp
attr_reader :id,
            :name,
            :address,
            :city

  def initialize(argument)
    @id = nil
    @name = argument[:businesses].first[:name]
    @address = argument[:businesses].first[:location][:display_address]
    @city = argument[:businesses].first[:location][:city]
  end
end
