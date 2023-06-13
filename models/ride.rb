class Ride < Sequel::Model
    attr_accessor :initial_location, :final_location, :ride_state, :ride_value, :description
    attr_accessor :code, :start_date, :end_date

    many_to_one :rider, class: :User
    many_to_one :driver, class: :User
end