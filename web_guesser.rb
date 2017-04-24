require 'sinatra'
require 'sinatra/reloader'

class NumGen
  attr_reader :secret_number

  def initialize
    @secret_number = rand(100)
  end
end

number = NumGen.new.secret_number
get '/' do
  guess = params["guess"]
  erb :index, :locals => {:number => number, :guess => guess}
  # throw params.inspect
  # params["guess"]

  # if the guess is too high
  #   set the message to "Too high!"
  # end
  # render the ERB template and pass in the number AND the message

end