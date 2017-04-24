require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :index
end

get '/test' do
  x = rand(100)
  "The secret number is #{x}"
end