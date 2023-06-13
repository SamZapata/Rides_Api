class Driver < Sequel::Model

    attr_accessor :code

    one_to_many :rides
end