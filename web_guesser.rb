require 'sinatra'

get '/' do
  "The secret world is #{rand(100)}"
end