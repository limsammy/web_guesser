require 'sinatra'
require 'sinatra/reloader'

class Guesser
  attr_accessor :guess
  attr_reader :secret_number

  def initialize(guess = nil)
    @secret_number = rand(100)
    @guess = guess
  end

  def message
    if @guess.to_i == @secret_number
      "You got it right!"
    elsif @guess.to_i > @secret_number
      "Your GUESS is too HIGH!"
    elsif @guess.to_i < @secret_number
      "Your GUESS is too LOW!"
    end
  end

end

guesser = Guesser.new

get '/' do
  guesser.guess = params["guess"]
  guess = guesser.guess
  number = guesser.secret_number
  erb :index, :locals => {:number => number,
                          :guess => guess,
                          :message => guesser.message}
  # throw params.inspect
  # params["guess"]

  # if the guess is too high
  #   set the message to "Too high!"
  # end
  # render the ERB template and pass in the number AND the message

end