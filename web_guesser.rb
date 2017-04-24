require 'sinatra'
require 'sinatra/reloader'

class Guesser
  attr_reader :secret_number, :guess

  def initialize(guess)
    @secret_number = rand(100)
    @guess = guess
  end

  def win
    if guess.to_i == @secret_number
    end
  end

end

get '/' do
  guess = Guesser.new
  number = guess.secret_number
  guess = params["guess"]
  erb :index, :locals => {:number => number,
                          :guess => guess,
                          :win => guess.win(guess)}
  # throw params.inspect
  # params["guess"]

  # if the guess is too high
  #   set the message to "Too high!"
  # end
  # render the ERB template and pass in the number AND the message

end