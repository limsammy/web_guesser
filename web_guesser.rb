require 'sinatra'
require 'sinatra/reloader'

get '/' do
  "The secret number is #{rand(100)}"
end

get '/test' do
  x = rand(100)
  "The secret number is #{x}"
end