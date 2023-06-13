require 'sinatra'
require 'json'
require_relative 'db/schema'
require_relative 'config/routes'

before do
    content_type 'application/json'
end
