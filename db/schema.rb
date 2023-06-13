require 'sequel'

DB = Sequel.connect(
  adapter: :postgres,
  database: 'api_rides',
  host: 'localhost',
  user: 'jsam',
  password: 'mayo2023',
)

DB.create_table? :users do
  primary_key :id
  Integer   :role_id
  String    :code
  String    :first_name, size: 50
  String    :last_name, size: 50
  Integer   :current_location
  DateTime  :created_at
  DateTime  :updated_at
  String    :user_email
  String    :phone_number
end

DB.create_table? :roles do
  primary_key :id
  String :name
  String :description
  Integer :code, size: 6
end

DB.create_table? :locations do
  primary_key :id
  String :latitude
  String :longitude
  String :description
  Integer :synccode
end

DB.create_table? :user_locations do
  primary_key :id
  Integer :user_id
  Integer :location_id
  String  :observation
  Integer :code, size: 6
end

DB.create_table? :rides do
  primary_key :id
  DateTime :start_date
  DateTime :end_date
  Integer :initial_location
  Integer :final_location
  Integer :rider
  Integer :driver
  Integer :ride_state
  Integer :ride_value
  String  :description, size: 50
  Integer :code, size: 20
end

DB.create_table? :ride_fees do
  primary_key :id
  Integer :ride
  Float   :price_by_km
  Float   :price_by_minute
  Float   :base_fee
  DateTime :date_base_fee
end

DB.create_table? :payments do
  primary_key :id
  Integer :code, size: 6
  Integer :user_id
  Integer :current_payment_method_id # pm_credit_card, pm_nequi, ...
  Float   :total_value
  String  :description
  DateTime :created_at
  DateTime :updated_at
  String  :status
end

# Starting only with credit or debit card
DB.create_table? :payment_methods do
  primary_key :id
  String :name, size: 30 
  Integer :code, size: 6
end

DB.create_table? :pm_credit_card do
  primary_key :id
  Integer :payment_method_id
  String  :number, size: 20
  String  :exp_month, size: 2
  String  :exp_year, size: 2
  String  :cvc, size: 4
  String  :card_holder, size: 30
  String  :status
  String  :id_token_response  
  String  :brand
  String  :name
  Integer :last_four, size: 4
  Integer :bin, size: 10
  DateTime :created_at
  DateTime :expires_at
end

DB.create_table? :user_payment_method do
  primary_key :id
  Integer :user
  Integer :payment_method
end

DB.create_table? :payment_sources do
  primary_key :id
  String  :type
  String  :token
  Integer :id_wompi, size: 6
  String  :customer_email
  String  :acceptance_token
  String  :status
end

DB.create_table? :transactions do
  primary_key :id
  Float   :amount_in_cents
  String  :currency
  String  :customer_email
  Integer :payment_method
  Integer :installments
  String  :reference
  Integer :payment_source
end

DB.create_table? :rides_states do
  primary_key :id
  String :name
  String :description
end

# foreign keys
# DB.alter_table(:users) do
#   add_foreign_key :role_id, :roles
# end

# DB.create_table? :drivers do
#   primary_key :id
#   String    :first_name, size: 50
#   String    :last_name, size: 50
#   String    :code
#   Integer   :current_location
#   DateTime  :created_at
#   DateTime  :updated_at
#   Integer   :user_id
# end

# DB.create_table? :riders do
#   primary_key :id
#   String    :first_name, size: 50
#   String    :last_name, size: 50
#   String    :code
#   Integer   :current_location
#   DateTime  :created_at
#   DateTime  :updated_at  
#   Integer   :user_id
# end