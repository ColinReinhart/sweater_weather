class MunchiesSerializer
  require "pry"; binding.pry
  include JSONAPI::Serializer
  attributes :id,
              :type,
              :weather,
              :restaurant
end
