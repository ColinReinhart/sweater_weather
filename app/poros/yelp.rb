class Yelp
attr_reader :id,
            :type,
            :name,
            :address

  def initialize(argument)
    @id = nil
    @type = 'munchie'
    @name = argument[:businesses].first[:name]
    @address = argument[:businesses].first[:location][:display_address]
  end
end
