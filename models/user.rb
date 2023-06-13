class User < Sequel::Model
    attr_accessor :role_id, :code, :current_location
    one_to_one  :role
    one_to_many :rider_rides, class: :Ride, key: :rider
    one_to_one  :driver_rides, class: :Ride, key: :driver
    one_to_many :locations
end