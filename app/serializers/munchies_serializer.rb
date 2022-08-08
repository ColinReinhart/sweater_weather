class MunchiesSerializer
  include JSONAPI::Serializer
  attributes :name,
              :address

end
