require 'sinatra'
require 'sinatra/reloader'

class Guesser
  attr_accessor :guess

  def initialize(guess = nil)
    @secret_number = rand(100)
    @guess = guess
  end

  def message
    if @guess.to_i == @secret_number
      "You got it right!\nYour SECRET number is #{@secret_number}!"
    elsif @guess.to_i > (@secret_number + 5)
      "Your GUESS is WAY TOO HIGH!"
    elsif @guess.to_i < (@secret_number - 5)
      "Your GUESS is WAY TOO LOW!"
    elsif @guess.to_i > @secret_number
      "Your GUESS is too high!"
    elsif @guess.to_i < @secret_number
      "Your GUESS is too low!"
    end
  end

  # def secret_number
  #   if @guess.to_i == @secret_number
  #     "Your SECRET number is #{@secret_number}!"
  #   end
  # end
end

guesser = Guesser.new

get '/' do
  guesser.guess = params["guess"]
  guess = guesser.guess
  erb :index, :locals => {:number => guesser.secret_number,
                          :guess => guess,
                          :message => guesser.message}
  # throw params.inspect
  # params["guess"]

  # if the guess is too high
  #   set the message to "Too high!"
  # end
  # render the ERB template and pass in the number AND the message

end