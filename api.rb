require 'sinatra'
require 'sequel'
require 'json'

before do
    content_type 'application/json'
end

get '/rides' do
    return "rides.to_json"
end

get '/' do
    redirect "/rides"
end