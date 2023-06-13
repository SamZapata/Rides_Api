class Location < Sequel::Model
    attr_accessor :latitude, :longitude, :description, :synccode

    many_to_one :user
end