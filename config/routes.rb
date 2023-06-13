require 'sinatra'
require 'sinatra/namespace'

get '/rides' do
    return "rides.to_json"
end

get '/' do
    redirect "/rides"
end

namespace '/rides' do
    
    get '/order' do
        ride = Ride.new
        return ride
    end

    post '/order' do
        ride = Ride.new
        ride
    end
end