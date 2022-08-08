class Yelp
attr_reader :name,
            :address

  def initialize(argument)
    @name = argument[:businesses].first[:name]
    @address = argument[:businesses].first[:location][:display_address]
  end
end
