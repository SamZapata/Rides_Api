require 'sequel'

DB = Sequel.connect(
  adapter: :postgres,
  database: 'api_rides',
  host: 'localhost',
  user: 'jsam',
  password: 'mayo2023',
)

DB.create_table? :riders do
    primary_key :id
    String :description, unique: true
    String :latitude
    String :longitude
end

DB.create_table? :drivers do
    primary_key :id
    String :description, unique: true
    String :final_latitude
    String :final_longitude
end